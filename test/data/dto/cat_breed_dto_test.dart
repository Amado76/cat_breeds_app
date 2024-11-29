import "package:cat_breeds_app/data/dto/cat_breed_dto.dart";
import "package:cat_breeds_app/domain/entities/cat_breed_entity.dart";
import "package:flutter_test/flutter_test.dart";
import "../../mocks/cat_breed_dto_mock.dart";
import "../../mocks/cat_breed_entity_mock.dart";
import "../../mocks/cat_breed_json_mock.dart";

void main() {
  test('Should return a valid CatBreedDto instance from JSON', () {
    final CatBreedDto catBreedDto = CatBreedDto.fromJson(catBreedJsonMock[0]);

    expect(catBreedDto, catBreedDtoMock);
  });

  test('Should return a valid CatBreedEntity instance from CatBreedDto', () {
    final CatBreedEntity catBreedEntity = catBreedDtoMock.toEntity();

    expect(catBreedEntity, catBreedEntityMock);
  });
}
