import 'package:cat_breeds_app/data/dto/cat_breed_dto.dart';

abstract class CatBreedRepository {
  Future<List<CatBreedDto>> getCatBreeds();
}
