import 'package:crispy_bacon_flutter_deals_app/core/logging/logger.dart';
import 'package:dio/dio.dart';
import 'retry_interceptor.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DioClient {
  final Dio _dio;
  final AppLogger _logger;

  DioClient({
    @Named('BaseUrl') required String baseUrl,
    required AppLogger logger,
  })  : _logger = logger,
        _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          headers: {
            'Accept': 'application/json',
          },
        )) {
    _dio.interceptors.add(RetryInterceptor(_dio));

    _dio.interceptors.add(LogInterceptor(
      request: false,
      requestHeader: false,
      requestBody: false,
      responseBody: false,
      responseHeader: false,
      error: true,
      logPrint: (log) => _logger.debug(log.toString()),
    ));
  }

  Dio get dio => _dio;
}
