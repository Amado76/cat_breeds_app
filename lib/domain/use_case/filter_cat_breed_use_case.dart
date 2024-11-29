import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';

class FilterCatBreedUseCase {
  List<CatBreedEntity> call(
      {required List<CatBreedEntity> catBreedList, required String query}) {
    if (query.isEmpty) {
      return catBreedList;
    }

    return catBreedList
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
