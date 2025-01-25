import 'package:crispy_bacon_flutter_deals_app/core/network/dio_client.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/data/models/deal_model.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/deal_entity.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/repositories/deals_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:crispy_bacon_flutter_deals_app/core/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DealsRepository)
class DealsRepositoryImpl implements DealsRepository {
  final DioClient dioClient;

  DealsRepositoryImpl(this.dioClient);

  @override
  Future<Either<Failure, List<Deal>>> getDeals({
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await dioClient.dio.get(
        '/deals',
        queryParameters: {
          'pageNumber': page,
          'pageSize': pageSize,
        },
      );

      print("RESPONSE_DATA: ${response.data}");

      final deals = (response.data as List).map((json) => DealModel.fromJson(json)).toList();

      return Right(deals);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
