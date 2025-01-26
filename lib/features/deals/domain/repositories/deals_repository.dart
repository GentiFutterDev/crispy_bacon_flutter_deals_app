import 'package:crispy_bacon_flutter_deals_app/core/error/failure.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/deal_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DealsRepository {
  Future<Either<Failure, List<Deal>>> getDeals({
    required int page,
    required int pageSize,
  });
}

