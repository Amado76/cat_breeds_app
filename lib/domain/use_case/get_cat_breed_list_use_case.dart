import 'package:cat_breeds_app/data/dto/cat_breed_dto.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/domain/repository/cat_breed_repository.dart';

class GetCatBreedListUseCase {
  final CatBreedRepository _catBreedRepository;

  GetCatBreedListUseCase({required CatBreedRepository catBreedRepository})
      : _catBreedRepository = catBreedRepository;

  Future<List<CatBreedEntity>> call() async {
    final List<CatBreedDto> catBreedDtoList =
        await _catBreedRepository.getCatBreeds();

    final List<CatBreedEntity> catBreedEntityList =
        catBreedDtoList.map((e) => e.toEntity()).toList();

    return catBreedEntityList;
  }
}
