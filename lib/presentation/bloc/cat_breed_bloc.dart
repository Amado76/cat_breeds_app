import 'package:cat_breeds_app/domain/use_case/filter_cat_breed_use_case.dart';
import 'package:cat_breeds_app/domain/use_case/get_cat_breed_list_use_case.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cat_breed_event.dart';
part 'cat_breed_state.dart';

class CatBreedBloc extends Bloc<CatBreedEvent, CatBreedState> {
  final GetCatBreedListUseCase getCatBreedListUseCase;
  final FilterCatBreedUseCase filterCatBreedUseCase;

  List<CatBreedEntity> catBreedList = [];
  CatBreedBloc(
      {required this.getCatBreedListUseCase,
      required this.filterCatBreedUseCase})
      : super(const CatBreedLoading()) {
    on<FetchCatBreedData>(_onFetchCatBreedData);
    on<FilterCatBreedData>(_onFilterCatBreedData);
  }

  void _onFetchCatBreedData(
      FetchCatBreedData event, Emitter<CatBreedState> emit) async {
    emit(const CatBreedLoading());
    try {
      catBreedList = await getCatBreedListUseCase();
      emit(CatBreedAllData(catBreedList));
    } catch (e) {
      emit(CatBreedError(e.toString()));
    }
  }

  void _onFilterCatBreedData(
      FilterCatBreedData event, Emitter<CatBreedState> emit) {
    try {
      final filteredCatBreedList =
          filterCatBreedUseCase(catBreedList: catBreedList, query: event.query);
      emit(CatBreedFilteredData(filteredCatBreedList));
    } catch (e) {
      emit(CatBreedError(e.toString()));
    }
  }
}
