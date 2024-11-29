import 'package:cat_breeds_app/core/constants.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:equatable/equatable.dart';

class CatBreedDto extends Equatable {
  final String id, origin, name, description, lifeSpan, referenceImageId;
  final int intelligence, adaptability;

  const CatBreedDto(
      {required this.id,
      required this.origin,
      required this.name,
      required this.description,
      required this.lifeSpan,
      required this.referenceImageId,
      required this.intelligence,
      required this.adaptability});

  factory CatBreedDto.fromJson(Map<String, dynamic> json) {
    return CatBreedDto(
      id: json['id'] ?? '',
      origin: json['origin'] ?? 'Unknown',
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? 'No description available',
      lifeSpan: json['life_span'] ?? '',
      referenceImageId: json['reference_image_id'] ?? '',
      intelligence: json['intelligence'] ?? 0,
      adaptability: json['adaptability'] ?? 0,
    );
  }

  CatBreedEntity toEntity() {
    return CatBreedEntity(
      id: id,
      origin: origin,
      name: name,
      description: description,
      lifeSpan: lifeSpan,
      intelligence: intelligence,
      adaptability: adaptability,
      imagePath: '$baseCatImageUrl$referenceImageId.jpg',
    );
  }

  @override
  List<Object?> get props =>
      [id, origin, name, description, lifeSpan, intelligence, adaptability];
}
