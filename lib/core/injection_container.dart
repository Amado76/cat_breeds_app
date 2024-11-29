import 'package:cat_breeds_app/core/http_client/http_client_interface.dart';
import 'package:cat_breeds_app/core/http_client/the_cat_api_key_interceptor.dart';
import 'package:cat_breeds_app/data/repository/cat_breed_repository_implementation.dart';
import 'package:cat_breeds_app/domain/repository/cat_breed_repository.dart';
import 'package:cat_breeds_app/domain/use_case/filter_cat_breed_use_case.dart';
import 'package:cat_breeds_app/domain/use_case/get_cat_breed_list_use_case.dart';
import 'package:cat_breeds_app/presentation/bloc/cat_breed_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  serviceLocator.registerLazySingleton<HttpClientInterface>(
    () => DioAdapter(
        dio: serviceLocator<Dio>(), interceptors: [TheCatApiKeyInterceptor()]),
  );
  serviceLocator.registerLazySingleton<CatBreedRepository>(
    () => CatBreedRepositoryImplementation(httpClient: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<FilterCatBreedUseCase>(
    () => FilterCatBreedUseCase(),
  );

  serviceLocator.registerLazySingleton<GetCatBreedListUseCase>(
    () => GetCatBreedListUseCase(
      catBreedRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<CatBreedBloc>(
    () => CatBreedBloc(
      getCatBreedListUseCase: serviceLocator(),
      filterCatBreedUseCase: serviceLocator(),
    ),
  );
}
