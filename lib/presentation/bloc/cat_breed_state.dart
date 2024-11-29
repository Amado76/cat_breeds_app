part of 'cat_breed_bloc.dart';

sealed class CatBreedState extends Equatable {
  const CatBreedState();
}

@immutable
class CatBreedLoading extends CatBreedState {
  const CatBreedLoading();
  @override
  List<Object> get props => [];
}

@immutable
class CatBreedAllData extends CatBreedState {
  final List<CatBreedEntity> catBreedEntityList;

  const CatBreedAllData(this.catBreedEntityList);

  @override
  List<Object> get props => [catBreedEntityList];
}

@immutable
class CatBreedFilteredData extends CatBreedState {
  final List<CatBreedEntity> catBreedEntityList;

  const CatBreedFilteredData(this.catBreedEntityList);

  @override
  List<Object> get props => [catBreedEntityList];
}

@immutable
class CatBreedError extends CatBreedState {
  final String message;

  const CatBreedError(this.message);

  @override
  List<Object> get props => [message];
}
