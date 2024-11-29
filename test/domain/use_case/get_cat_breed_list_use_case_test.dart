import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/domain/repository/cat_breed_repository.dart';
import 'package:cat_breeds_app/domain/use_case/get_cat_breed_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/cat_breed_dto_mock.dart';
import '../../mocks/cat_breed_entity_mock.dart';
import '../../mocks/cat_breed_repository_mock.dart';

void main() {
  final CatBreedRepository catBreedRepository = CatBreedRepositoryMock();
  final GetCatBreedListUseCase getCatBreedListUseCase =
      GetCatBreedListUseCase(catBreedRepository: catBreedRepository);

  test('Should return a list of CatBreedEntity', () async {
    when(() => catBreedRepository.getCatBreeds())
        .thenAnswer((_) async => [catBreedDtoMock]);

    final List<CatBreedEntity> result = await getCatBreedListUseCase();

    expect(result, [catBreedEntityMock]);
  });
}
