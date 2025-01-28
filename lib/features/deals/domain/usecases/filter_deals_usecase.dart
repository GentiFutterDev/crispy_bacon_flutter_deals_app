import 'package:dartz/dartz.dart';
import 'package:crispy_bacon_flutter_deals_app/core/error/failure.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/deal_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class FilterDeals {
  Future<Either<Failure, List<Deal>>> call({
    required List<Deal> unfilteredDeals,
    required double minPrice,
    required double maxPrice,
  }) async {
    try {
      final filteredDeals = unfilteredDeals.where((deal) {
        return deal.price >= minPrice && deal.price <= maxPrice;
      }).toList();

      return Right(filteredDeals);
    } catch (e) {
      return Left(UnexpectedFailure('Failed to filter deals: ${e.toString()}'));
    }
  }
}
