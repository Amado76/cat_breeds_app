import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAdaptativeCard extends StatelessWidget {
  const MyAdaptativeCard({super.key, required this.catBreedEntity});

  final CatBreedEntity catBreedEntity;

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return isIOS ? _buildCupertinoCard(context) : _buildMaterialCard(context);
  }

  Widget _buildCupertinoCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: _buildCardContent(
        context,
        button: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/detail',
              arguments: catBreedEntity,
            );
          },
          child: Text(
            'See more ',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: _buildCardContent(
        context,
        button: TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/detail',
              arguments: catBreedEntity,
            );
          },
          child: const Text(
            'See more',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, {required Widget button}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  catBreedEntity.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              button,
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/image_place_holder.png',
              image: catBreedEntity.imagePath,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              imageErrorBuilder: (context, error, stackTrace) => const Center(
                child: Image(
                    height: 200,
                    image: AssetImage('assets/images/image_place_holder.png')),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Country of Origin:',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                catBreedEntity.origin,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
