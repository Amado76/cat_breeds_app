part of 'cat_breed_bloc.dart';

sealed class CatBreedEvent extends Equatable {
  const CatBreedEvent();
}

@immutable
class FetchCatBreedData extends CatBreedEvent {
  const FetchCatBreedData();
  @override
  List<Object> get props => [];
}

@immutable
class FilterCatBreedData extends CatBreedEvent {
  final String query;

  const FilterCatBreedData({required this.query});

  @override
  List<Object> get props => [query];
}
