import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';

const CatBreedEntity catBreedEntityMock = CatBreedEntity(
    id: "abys",
    origin: "Egypt",
    name: "Abyssinian",
    description:
        "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
    lifeSpan: "14 - 15",
    intelligence: 5,
    adaptability: 5,
    imagePath: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg");

const List<CatBreedEntity> catBreedListMock = [
  CatBreedEntity(
      id: "abys",
      origin: "Egypt",
      name: "Abyssinian",
      description:
          "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
      lifeSpan: "14 - 15",
      intelligence: 5,
      adaptability: 5,
      imagePath: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"),
  CatBreedEntity(
      id: "aege",
      origin: "Greece",
      name: "Aegean",
      description:
          "The Aegean cat is a natural breed, native to the Greek islands. This breed is known for its affectionate nature and intelligence.",
      lifeSpan: "9 - 12",
      intelligence: 5,
      adaptability: 5,
      imagePath: "https://cdn2.thecatapi.com/images/1Qj-8V3xu.jpg"),
  CatBreedEntity(
      id: "abob",
      origin: "United States",
      name: "American Bobtail",
      description:
          "American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.",
      lifeSpan: "11 - 15",
      intelligence: 5,
      adaptability: 5,
      imagePath: "https://cdn2.thec/images/MTU3NjYyOQ.jpg"),
];

const List<CatBreedEntity> catBreedFilteredList = [
  CatBreedEntity(
      id: "abys",
      origin: "Egypt",
      name: "Abyssinian",
      description:
          "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
      lifeSpan: "14 - 15",
      intelligence: 5,
      adaptability: 5,
      imagePath: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"),
];
