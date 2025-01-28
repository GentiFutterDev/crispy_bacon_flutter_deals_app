import 'package:crispy_bacon_flutter_deals_app/core/logging/logger.dart';
import 'package:crispy_bacon_flutter_deals_app/core/network/dio_client.dart';
import 'package:crispy_bacon_flutter_deals_app/core/network/network_info.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/data/datasources/deals_local_data_source.dart';
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
    final AppLogger logger;
    final DealsLocalDataSource localDataSource;
    final NetworkInfo networkInfo;

    DealsRepositoryImpl({
      required this.dioClient,
      required this.logger,
      required this.localDataSource,
      required this.networkInfo,
    });
  
  @override
  Future<Either<Failure, List<Deal>>> getDeals({
    required int page,
    required int pageSize,
  }) async {
    if (await networkInfo.isConnected()) {
      return await _fetchFromRemote(page: page, pageSize: pageSize);
    } else {
      return await _fetchFromLocal();
    }
  }

@override
Future<Either<Failure, void>> likeDeal(String dealId) async {
  try {
    await localDataSource.likeDeal(dealId);
    return const Right(null);
  } catch (e) {
    return Left(CacheFailure('Failed to toggle like status'));
  }
}


  @override
  Future<Either<Failure, bool>> isDealLiked(String dealId) async {
    try {
      logger.info('Checking if deal with ID: $dealId is liked');
      final isLiked = await localDataSource.isDealLiked(dealId);
      logger.debug('Deal with ID $dealId is liked: $isLiked');
      return Right(isLiked);
    } catch (e, stackTrace) {
      logger.error('Error checking like status for deal with ID: $dealId', e, stackTrace);
      return Left(CacheFailure('Failed to check like status'));
    }
  }

  Future<Either<Failure, List<Deal>>> _fetchFromRemote({
    required int page,
    required int pageSize,
  }) async {
    try {
      logger.info('Fetching deals from API for page: $page, pageSize: $pageSize');

      final response = await dioClient.dio.get(
        '/deals',
        queryParameters: {
          'pageNumber': page,
          'pageSize': pageSize,
        },
      );

      final dealModels = (response.data as List).map((json) => DealModel.fromJson(json)).toList();

      await localDataSource.cacheDeals(dealModels);

      logger.debug("Cached Deals");

      final deals = dealModels.map((model) => model.toEntity()).toList();
      
      logger.debug("deals: $deals");
      return Right(deals);
    } on DioException catch (e) {
      logger.error('DioException occurred: ${e.message}', e, e.stackTrace);
      return Left(ServerFailure(e.message));
    } catch (e, stackTrace) {
      logger.error('Unexpected error occurredHere: $e', e, stackTrace);
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<Deal>>> _fetchFromLocal() async {
    try {
      logger.info('No network connection. Fetching deals from local database.');

      final cachedDeals = await localDataSource.getCachedDeals();

      if (cachedDeals.isEmpty) {
        logger.warning('No cached deals found.');
        return Left(CacheFailure('No cached deals available'));
      }

      final deals = cachedDeals.map((model) => model.toEntity()).toList();
      return Right(deals);
    } catch (e, stackTrace) {
      logger.error('Error fetching cached deals: $e', e, stackTrace);
      return Left(CacheFailure('Failed to fetch cached deals'));
    }
  }
}

