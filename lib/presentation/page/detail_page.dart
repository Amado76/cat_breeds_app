import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/presentation/components/adaptative_app_bar.dart';
import 'package:cat_breeds_app/presentation/components/attribute_row_widget.dart';
import 'package:cat_breeds_app/presentation/components/detail_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CatBreedEntity catBreedEntity =
        ModalRoute.of(context)!.settings.arguments as CatBreedEntity;
    const double spaceBetween = 10;
    return Scaffold(
      appBar: AdaptativeAppBar(
        title: catBreedEntity.name,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/image_place_holder.png',
                image: catBreedEntity.imagePath,
                fit: BoxFit.cover,
                height: 400,
                width: double.infinity,
                imageErrorBuilder: (context, error, stackTrace) => const Center(
                  child: Image(
                      height: 400,
                      image:
                          AssetImage('assets/images/image_place_holder.png')),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.justify,
                          catBreedEntity.description,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: spaceBetween),
                        DetailRowWidget(
                          title: 'Country of Origin: ',
                          value: catBreedEntity.origin,
                        ),
                        const SizedBox(height: spaceBetween),
                        DetailRowWidget(
                          title: 'Life Span: ',
                          value: "${catBreedEntity.lifeSpan} years",
                        ),
                        const SizedBox(height: spaceBetween),
                        AttributeRowWidget(
                          attribute: 'Intelligence: ',
                          value: catBreedEntity.intelligence,
                        ),
                        const SizedBox(height: spaceBetween),
                        AttributeRowWidget(
                          attribute: 'Adaptability: ',
                          value: catBreedEntity.adaptability,
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
