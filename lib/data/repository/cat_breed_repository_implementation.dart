import 'package:cat_breeds_app/core/constants.dart';
import 'package:cat_breeds_app/core/http_client/http_client_interface.dart';
import 'package:cat_breeds_app/data/dto/cat_breed_dto.dart';
import 'package:cat_breeds_app/domain/repository/cat_breed_repository.dart';

class CatBreedRepositoryImplementation extends CatBreedRepository {
  final HttpClientInterface _httpClient;

  CatBreedRepositoryImplementation({required HttpClientInterface httpClient})
      : _httpClient = httpClient;

  @override
  Future<List<CatBreedDto>> getCatBreeds() async {
    final response =
        await _httpClient.get(path: '$baseCatApiUrl/$getCatsBreedPath');
    return (response.data as List).map((e) => CatBreedDto.fromJson(e)).toList();
  }
}
