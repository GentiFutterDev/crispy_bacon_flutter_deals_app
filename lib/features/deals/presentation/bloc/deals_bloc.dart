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
    on<ApplyPriceFilterEvent>(_onApplyPriceFilter);
  }

  Future<void> _onLoadDeals(
    LoadDealsEvent event,
    Emitter<DealsState> emit,
  ) async {
    final currentState = state;

    List<Deal> existingDeals = [];
    PriceRange? currentPriceRange;

    if (currentState is DealsLoaded) {
      existingDeals = currentState.unfilteredDeals;
      currentPriceRange = currentState.priceRange;
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
        emit(DealsLoaded(
          unfilteredDeals: existingDeals,
          filteredDeals: existingDeals,
          hasMore: true,
          priceRange: currentPriceRange,
        ));
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

        // Apply the current price range filter to the updated list of deals
        final filteredDeals = (currentPriceRange != null)
            ? combinedDeals.where((deal) {
                final minPrice = currentPriceRange!.minPrice;
                final maxPrice = currentPriceRange.maxPrice;
                return deal.price >= minPrice && deal.price <= maxPrice;
              }).toList()
            : combinedDeals;

        emit(DealsLoaded(
          unfilteredDeals: combinedDeals,
          filteredDeals: filteredDeals,
          hasMore: hasMore,
          priceRange: currentPriceRange,
        ));
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

        final updatedDeals = currentState.unfilteredDeals.map((deal) {
          if (deal.id == event.dealId) {
            final newLikedState = !deal.isLiked;
            return deal.copyWith(isLiked: newLikedState);
          }
          return deal;
        }).toList();

        final filteredDeals = currentState.priceRange != null
            ? updatedDeals.where((deal) {
                final minPrice = currentState.priceRange!.minPrice;
                final maxPrice = currentState.priceRange!.maxPrice;
                return deal.price >= minPrice && deal.price <= maxPrice;
              }).toList()
            : updatedDeals;

        emit(DealsLoaded(
          unfilteredDeals: updatedDeals,
          filteredDeals: filteredDeals,
          hasMore: currentState.hasMore,
          priceRange: currentState.priceRange,
        ));

        final toggleResult = await likeDeal(event.dealId);

        toggleResult.fold(
          (failure) {
            final revertedDeals = updatedDeals.map((deal) {
              if (deal.id == event.dealId) {
                return deal.copyWith(isLiked: !deal.isLiked); 
              }
              return deal;
            }).toList();

            final revertedFilteredDeals = currentState.priceRange != null
                ? revertedDeals.where((deal) {
                    final minPrice = currentState.priceRange!.minPrice;
                    final maxPrice = currentState.priceRange!.maxPrice;
                    return deal.price >= minPrice && deal.price <= maxPrice;
                  }).toList()
                : revertedDeals;

            emit(DealsLoaded(
              unfilteredDeals: revertedDeals,
              filteredDeals: revertedFilteredDeals,
              hasMore: currentState.hasMore,
              priceRange: currentState.priceRange,
            ));

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

  Future<void> _onApplyPriceFilter(
    ApplyPriceFilterEvent event,
    Emitter<DealsState> emit,
  ) async {
    if (state is DealsLoaded) {
      final currentState = state as DealsLoaded;

      final filteredDeals = currentState.unfilteredDeals.where((deal) {
        return deal.price >= event.priceRange.minPrice &&
              deal.price <= event.priceRange.maxPrice;
      }).toList();

      print("UnfilteredDeals: ${currentState.unfilteredDeals}");
      print("FilteredDeals: $filteredDeals");

      emit(DealsLoaded(
        unfilteredDeals: currentState.unfilteredDeals,
        filteredDeals: filteredDeals,
        hasMore: currentState.hasMore,
        priceRange: event.priceRange,
      ));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) return 'Server failure occurred.';
    if (failure is NetworkFailure) return 'Please check your internet connection.';
    if (failure is ParsingFailure) return 'Failed to parse the data.';
    return 'Unexpected error occurred.';
  }
}
