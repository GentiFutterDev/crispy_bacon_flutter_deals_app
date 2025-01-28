import 'package:crispy_bacon_flutter_deals_app/core/logging/logger.dart';
import 'package:dio/dio.dart';
import 'retry_interceptor.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DioClient {
  final Dio _dio;

  DioClient({
  @Named('BaseUrl') required String baseUrl,
  required AppLogger logger
  })
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          headers: {
            'Accept': 'application/json',
          },
        )) {
    logger.info('DioClient initialized with baseUrl: $baseUrl');
    _dio.interceptors.add(RetryInterceptor(_dio));
  }

  Dio get dio => _dio;
}
