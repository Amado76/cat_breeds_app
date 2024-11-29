import 'package:cat_breeds_app/data/dto/cat_breed_dto.dart';
import 'package:cat_breeds_app/data/repository/cat_breed_repository_implementation.dart';
import 'package:cat_breeds_app/domain/repository/cat_breed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/cat_breed_json_mock.dart';
import '../../mocks/http_client_mock.dart';

void main() {
  final httpClient = HttpClientMock();
  final CatBreedRepository catBreedRepository =
      CatBreedRepositoryImplementation(httpClient: httpClient);
  test('should return a list of CatBreedDto', () async {
    // Arrange
    when(() => httpClient.get(path: any(named: 'path')))
        .thenAnswer((_) async => (data: catBreedJsonMock, statusCode: 200));
    // Act
    final result = await catBreedRepository.getCatBreeds();
    // Assert
    expect(result, isA<List<CatBreedDto>>());
  });
}
