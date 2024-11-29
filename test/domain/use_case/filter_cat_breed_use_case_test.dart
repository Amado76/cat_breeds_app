import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/domain/use_case/filter_cat_breed_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/cat_breed_entity_mock.dart';

void main() {
  final FilterCatBreedUseCase filterCatBreedUseCase = FilterCatBreedUseCase();
  group('FilterCatBreedUseCase', () {
    test('should return a list of cat breeds that contains the query', () {
      const String query = 'Abyssinian';
      const List<CatBreedEntity> catBreedList = catBreedListMock;

      final List<CatBreedEntity> result =
          filterCatBreedUseCase.call(catBreedList: catBreedList, query: query);

      expect(result, [catBreedEntityMock]);
    });
    test('should return a list of cat breeds that contains the query', () {
      const String query = 'A';
      const List<CatBreedEntity> catBreedList = catBreedListMock;

      final List<CatBreedEntity> result =
          filterCatBreedUseCase.call(catBreedList: catBreedList, query: query);

      expect(result, catBreedListMock);
    });

    test('should return a list of cat breeds when the query is empty', () {
      const String query = '';
      const List<CatBreedEntity> catBreedList = catBreedListMock;

      final List<CatBreedEntity> result =
          filterCatBreedUseCase.call(catBreedList: catBreedList, query: query);

      expect(result, catBreedListMock);
    });

    test('shoul return a empty list when the query is not found', () {
      const String query = 'Not Found';
      const List<CatBreedEntity> catBreedList = catBreedListMock;

      final List<CatBreedEntity> result =
          filterCatBreedUseCase.call(catBreedList: catBreedList, query: query);

      expect(result, []);
    });
  });
}
