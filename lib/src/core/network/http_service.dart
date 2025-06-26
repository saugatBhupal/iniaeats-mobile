import 'package:dio/dio.dart';
import 'package:inaeats/src/core/http/api_endpoints.dart';
import 'package:inaeats/src/core/http/dio_service_interceptor.dart';
import 'package:inaeats/src/core/network/auth_interceptor.dart';
import 'package:inaeats/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpService {
  final Dio _dio;

  Dio get dio => _dio;

  HttpService() : _dio = Dio() {
    _dio
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.connectTimeout = ApiEndpoints.connectionTimeout
      ..options.receiveTimeout = ApiEndpoints.receiveTimeout
      ..interceptors.add(DioErrorInterceptor())
      ..interceptors.add(
        AuthInterceptor(() async {
          final result = await UserSharedPref().getUserToken();
          return result.fold((_) => null, (token) => token);
        }),
      )
      ..interceptors.add(
        PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true),
      )
      ..options.headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('[DEBUG] Request Headers: ${options.headers}');
          return handler.next(options);
        },
      ),
    );
  }
}
