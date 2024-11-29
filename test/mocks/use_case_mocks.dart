import 'package:cat_breeds_app/domain/use_case/filter_cat_breed_use_case.dart';
import 'package:cat_breeds_app/domain/use_case/get_cat_breed_list_use_case.dart';
import 'package:mocktail/mocktail.dart';

class GetCatBreedListUseCaseMock extends Mock
    implements GetCatBreedListUseCase {}

class FilterCatBreedUseCaseMock extends Mock implements FilterCatBreedUseCase {}
