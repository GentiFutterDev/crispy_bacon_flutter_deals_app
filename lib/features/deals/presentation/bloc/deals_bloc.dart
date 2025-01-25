import 'package:bloc/bloc.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/usecases/get_deals_usecase.dart';
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

  DealsBloc(this.getDeals) : super(DealsInitial()) {
    on<LoadDealsEvent>(_onLoadDeals);
  }

  Future<void> _onLoadDeals(
    LoadDealsEvent event,
    Emitter<DealsState> emit,
  ) async {
    emit(DealsLoading());

    final Either<Failure, List<Deal>> result = 
          await getDeals(page: event.page, pageSize: event.pageSize);

    result.fold(
      (failure) => emit(DealsError(_mapFailureToMessage(failure))),
      (deals) {
        if (deals.isEmpty) {
          emit(DealsError('No deals found.'));
        } else {
          emit(DealsLoaded(deals));
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) return 'Server failure occurred.';
    if (failure is NetworkFailure) return 'Please check your internet connection.';
    if (failure is ParsingFailure) return 'Failed to parse the data.';
    return 'Unexpected error occurred.';
  }
}
