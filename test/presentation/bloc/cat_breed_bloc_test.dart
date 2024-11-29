import 'package:bloc_test/bloc_test.dart';
import 'package:cat_breeds_app/domain/use_case/filter_cat_breed_use_case.dart';
import 'package:cat_breeds_app/domain/use_case/get_cat_breed_list_use_case.dart';
import 'package:cat_breeds_app/presentation/bloc/cat_breed_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/cat_breed_entity_mock.dart';
import '../../mocks/use_case_mocks.dart';

void main() {
  late GetCatBreedListUseCase getCatBreedListUseCaseMock;
  late FilterCatBreedUseCase filterCatBreedUseCaseMock;
  late CatBreedBloc catBreedBloc;

  setUp(() {
    getCatBreedListUseCaseMock = GetCatBreedListUseCaseMock();
    filterCatBreedUseCaseMock = FilterCatBreedUseCaseMock();

    catBreedBloc = CatBreedBloc(
        getCatBreedListUseCase: getCatBreedListUseCaseMock,
        filterCatBreedUseCase: filterCatBreedUseCaseMock);
  });

  test('Initial state should be CatBreedLoading', () {
    expect(catBreedBloc.state, const CatBreedLoading());
  });

  group('FetchCatBreedData', () {
    blocTest(
      'Should emit CatBreedLoading, then CatBreedAllData when successful',
      build: () => catBreedBloc,
      setUp: () {
        when(() => getCatBreedListUseCaseMock())
            .thenAnswer((_) async => catBreedListMock);
      },
      act: (bloc) => bloc.add(const FetchCatBreedData()),
      expect: () => [
        const CatBreedLoading(),
        const CatBreedAllData(catBreedListMock),
      ],
    );

    blocTest<CatBreedBloc, CatBreedState>(
      'Should emit CatBreedLoading, then CatBreedError when unsuccessful',
      build: () => catBreedBloc,
      setUp: () {
        when(() => getCatBreedListUseCaseMock()).thenThrow(Exception());
      },
      act: (bloc) => bloc.add(const FetchCatBreedData()),
      expect: () => [
        const CatBreedLoading(),
        isA<CatBreedError>(),
      ],
    );
  });

  group('FilterCatBreedData', () {
    blocTest<CatBreedBloc, CatBreedState>(
      'Should emit CatBreedFilteredData when successful',
      build: () => catBreedBloc,
      setUp: () {
        catBreedBloc.catBreedList = catBreedListMock;
        when(() => filterCatBreedUseCaseMock(
            catBreedList: catBreedListMock,
            query: 'Abyssinian')).thenReturn(catBreedFilteredList);
      },
      act: (bloc) => bloc.add(const FilterCatBreedData(query: 'Abyssinian')),
      expect: () => [
        const CatBreedFilteredData(catBreedFilteredList),
      ],
    );

    blocTest(
      'Should emit CatBreedError when unsuccessful',
      build: () => catBreedBloc,
      setUp: () {
        when(() => filterCatBreedUseCaseMock(
            catBreedList: catBreedListMock,
            query: 'Abyssinian')).thenThrow(Exception());
      },
      act: (bloc) => bloc.add(const FilterCatBreedData(query: 'Abyssinian')),
      expect: () => [
        isA<CatBreedError>(),
      ],
    );
  });
}
