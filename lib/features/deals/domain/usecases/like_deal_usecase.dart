import 'package:crispy_bacon_flutter_deals_app/core/error/failure.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/repositories/deals_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LikeDeal {
  final DealsRepository repository;

  LikeDeal(this.repository);

  Future<Either<Failure, void>> call(String dealId) async {
    return await repository.likeDeal(dealId);
  }
}
