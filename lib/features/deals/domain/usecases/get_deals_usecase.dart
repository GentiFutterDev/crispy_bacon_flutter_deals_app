import 'package:dartz/dartz.dart';
import 'package:crispy_bacon_flutter_deals_app/core/error/failure.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/deal_entity.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/repositories/deals_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDeals {
  final DealsRepository repository;

  GetDeals(this.repository);

  Future<Either<Failure, List<Deal>>> call({required int page, required int pageSize}) async {
    final result = await repository.getDeals(page: page, pageSize: pageSize);

    return result.fold(
      (failure) => Left(failure),
      (deals) => Right(deals),
    );
  }
}
