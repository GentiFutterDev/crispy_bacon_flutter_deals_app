import 'package:bloc/bloc.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/get_deals_usecase.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/is_deal_liked.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/like_deal_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:crispy_bacon_flutter_deals_app/core/error/failure.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/deal_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'deals_event.dart';
part 'deals_state.dart';

@injectable
class DealsBloc extends Bloc<DealsEvent, DealsState> {
  final GetDeals getDeals;
  final LikeDeal likeDeal;
  final IsDealLiked isDealLiked;

  DealsBloc(this.getDeals, this.likeDeal, this.isDealLiked) : super(DealsInitial()) {
    on<LoadDealsEvent>(_onLoadDeals);
    on<ToggleLikeDealEvent>(_onToggleLikeDeal); 
  }

  Future<void> _onLoadDeals(
    LoadDealsEvent event,
    Emitter<DealsState> emit,
  ) async {
    final currentState = state;

    List<Deal> existingDeals = [];
    if (currentState is DealsLoaded) {
      existingDeals = currentState.deals;
    } else if (currentState is DealsLoadingMore) {
      existingDeals = currentState.existingDeals;
    }

    emit(DealsLoadingMore(existingDeals: existingDeals));

    final Either<Failure, List<Deal>> result = await getDeals(
      page: event.page,
      pageSize: event.pageSize,
    );

    result.fold(
      (failure) {
        emit(DealsError(_mapFailureToMessage(failure)));
        emit(DealsLoaded(existingDeals, hasMore: true));
      },
      (newDeals) {
        final combinedDeals = (existingDeals + newDeals)
            .fold<Map<String, Deal>>({}, (map, deal) {
              map[deal.id] = deal;
              return map;
            })
            .values
            .toList();

        final hasMore = newDeals.length == event.pageSize;

        emit(DealsLoaded(combinedDeals, hasMore: hasMore));
      },
    );
  }

  Future<void> _onToggleLikeDeal(
    ToggleLikeDealEvent event,
    Emitter<DealsState> emit,
  ) async {
    try {
      if (state is DealsLoaded) {
        final currentState = state as DealsLoaded;

        final updatedDeals = currentState.deals.map((deal) {
          if (deal.id == event.dealId) {
            final newLikedState = !deal.isLiked;
            return deal.copyWith(isLiked: newLikedState);
          }
          return deal;
        }).toList();

        emit(DealsLoaded(updatedDeals, hasMore: currentState.hasMore));

        final toggleResult = await likeDeal(event.dealId);

        toggleResult.fold(
          (failure) {
            final revertedDeals = updatedDeals.map((deal) {
              if (deal.id == event.dealId) {
                return deal.copyWith(isLiked: !deal.isLiked);
              }
              return deal;
            }).toList();

            emit(DealsLoaded(revertedDeals, hasMore: currentState.hasMore));
            emit(DealsError('Failed to toggle like status'));
          },
          (_) {
          },
        );
      }
    } catch (e) {
      emit(DealsError('An unexpected error occurred: ${e.toString()}'));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) return 'Server failure occurred.';
    if (failure is NetworkFailure) return 'Please check your internet connection.';
    if (failure is ParsingFailure) return 'Failed to parse the data.';
    return 'Unexpected error occurred.';
  }
}
