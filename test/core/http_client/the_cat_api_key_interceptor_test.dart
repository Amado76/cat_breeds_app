import 'package:cat_breeds_app/core/http_client/the_cat_api_key_interceptor.dart';
import 'package:cat_breeds_app/env/env.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/dio_mock.dart';

void main() {
  group('[TheCatApiKeyInterceptor Tests]', () {
    final TheCatApiKeyInterceptor interceptor = TheCatApiKeyInterceptor();
    final String theCatApiKey = Env.theCatApiKey;

    test(
      "should ignore the interceptor when the 'skipTheCatApiKeyInterceptor' is true",
      () async {
        final interceptor = TheCatApiKeyInterceptor();
        final request = RequestOptionsMock();
        final handler = RequestInterceptorHandlerMock();

        when(() => request.extra)
            .thenReturn({'skipTheCatApiKeyInterceptor': true});

        when(() => request.headers).thenReturn({});

        interceptor.onRequest(request, handler);
        verify(() => handler.next(request));
        verifyNever(() => request.headers['x-api-key']);
      },
    );

    test('should return an AuthUserEntity instance for authUserEntity property',
        () async {
      final request = RequestOptionsMock();
      final handler = RequestInterceptorHandlerMock();

      when(() => request.headers).thenReturn({});
      when(() => request.extra)
          .thenReturn({'skipTheCatApiKeyInterceptor': false});

      // Com o token setado, o interceptor deve adicionar o token ao header
      interceptor.onRequest(request, handler);
      verify(() => handler.next(request)).called(1);
      verify(() => request.headers['x-api-key']).called(1);
      expect(request.headers['x-api-key'], equals(theCatApiKey));
    });
  });
}
