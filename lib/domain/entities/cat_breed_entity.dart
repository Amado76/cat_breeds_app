import 'package:equatable/equatable.dart';

class CatBreedEntity extends Equatable {
  final String id, origin, name, description, lifeSpan, imagePath;
  final int intelligence, adaptability;

  const CatBreedEntity({
    required this.id,
    required this.origin,
    required this.name,
    required this.description,
    required this.lifeSpan,
    required this.intelligence,
    required this.adaptability,
    required this.imagePath,
  });

  @override
  List<Object?> get props =>
      [id, origin, name, description, lifeSpan, intelligence, adaptability];
}
