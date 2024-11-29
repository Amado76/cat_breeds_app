import 'package:cat_breeds_app/env/env.dart';
import 'package:dio/dio.dart';

class TheCatApiKeyInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra["skipTheCatApiKeyInterceptor"] == true) {
      return handler.next(options);
    }

    options.headers.addAll({"x-api-key": Env.theCatApiKey});

    return handler.next(options);
  }
}
