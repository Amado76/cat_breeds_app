import 'package:cat_breeds_app/core/http_client/http_client_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../mocks/dio_mock.dart';
import '../../mocks/the_cat_api_key_interceptor_mock.dart';

void main() {
  final dioMock = DioMock();
  final HttpClientInterface httpClientAdapter = DioAdapter(dio: dioMock);

  group('[get]', () {
    test('should return {"data":"data"} and status code 200', () async {
      //Arrange

      when(() => dioMock.get(any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'))).thenAnswer((_) async => dioResponse);
      //Act
      final result = await httpClientAdapter.get(path: 'path');
      //Assert
      expect(result.data, {'data': 'data'});
      expect(result.statusCode, 200);
    });
  });

  group('[DioAdapter]', () {
    test('should add interceptors to Dio', () {
      //Arrange
      final statusErrorInterceptorMock = TheCatApiKeyInterceptorMock();
      final dioAdapter =
          DioAdapter(dio: Dio(), interceptors: [statusErrorInterceptorMock]);

      //Assert
      expect(dioAdapter.interceptorList, contains(statusErrorInterceptorMock));
    });
  });
}

Response dioResponse = Response(
    data: {'data': 'data'},
    statusCode: 200,
    requestOptions: RequestOptions(path: 'path'));
