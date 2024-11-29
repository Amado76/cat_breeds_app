import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

class RequestOptionsMock extends Mock implements RequestOptions {}

class RequestInterceptorHandlerMock extends Mock
    implements RequestInterceptorHandler {}
