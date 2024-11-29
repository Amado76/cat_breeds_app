import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;

// Neste aplicativo de exemplo, apenas o método GET foi implementado, pois é o único necessário para as funcionalidades
// atuais.
// Em um aplicativo real, seria possível (e recomendável) implementar também outros métodos HTTP, como POST, PUT e
// DELETE,
// dependendo das necessidades da aplicação.

abstract class HttpClientInterface {
  const HttpClientInterface();

  Future<({dynamic data, int? statusCode})> get(
      {required String path,
      Map<String, dynamic>? extra,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters});
}

class DioAdapter implements HttpClientInterface {
  DioAdapter({required this.dio, List<Interceptor>? interceptors}) {
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }
  }
  final Dio dio;
  ProgressCallback? progressCallback;
  CancelToken? cancelToken;

  @override
  Future<({dynamic data, int? statusCode})> get({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response result = await dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return (data: result.data, statusCode: result.statusCode);
  }

  @visibleForTesting
  get interceptorList => dio.interceptors;
}
