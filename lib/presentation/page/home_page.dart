import 'package:cat_breeds_app/core/injection_container.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/presentation/bloc/cat_breed_bloc.dart';
import 'package:cat_breeds_app/presentation/components/adaptative_app_bar.dart';
import 'package:cat_breeds_app/presentation/components/my_adaptative_card.dart';
import 'package:cat_breeds_app/presentation/components/my_adaptive_search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<CatBreedEntity> catBreedEntityList;
  final CatBreedBloc catBreedBloc = serviceLocator<CatBreedBloc>();

  final TextEditingController queryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    catBreedEntityList = catBreedBloc.catBreedList;
  }

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CatBreedBloc catBreedBloc = serviceLocator<CatBreedBloc>();
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
        appBar: const AdaptativeAppBar(
          title: 'Catbreeds',
        ),
        body: BlocConsumer<CatBreedBloc, CatBreedState>(
          bloc: catBreedBloc,
          listener: (context, state) {
            if (state is CatBreedFilteredData) {
              catBreedEntityList = List.from(state.catBreedEntityList);
            }
          },
          builder: (context, state) {
            if (catBreedEntityList.isEmpty) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: AdaptiveSearchField(
                      controller: queryController,
                      onChanged: (query) {
                        catBreedBloc.add(FilterCatBreedData(query: query));
                      },
                    ),
                  ),
                  const Text('The query returned no results'),
                ],
              );
            }
            return ListView.builder(
              physics: isIOS
                  ? const BouncingScrollPhysics()
                  : const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              itemCount: catBreedEntityList.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      AdaptiveSearchField(
                        controller: queryController,
                        onChanged: (query) {
                          catBreedBloc.add(FilterCatBreedData(query: query));
                        },
                      ),
                      const SizedBox(height: 20),
                      MyAdaptativeCard(
                        catBreedEntity: catBreedEntityList[index],
                      ),
                    ],
                  );
                }
                return MyAdaptativeCard(
                  catBreedEntity: catBreedEntityList[index],
                );
              },
            );
          },
        ));
  }
}
