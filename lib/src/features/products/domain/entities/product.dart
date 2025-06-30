import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/features/products/domain/entities/allergen.dart';
import 'package:inaeats/src/features/products/domain/entities/tag.dart';
import 'package:uuid/uuid.dart';

class Product {
  final String id;
  final String productName;
  final String productDescription;
  final int shelfLife;
  final int portion;
  final int price;
  final DietType dietType;
  final String productType;
  final int weight;
  final int calories;
  final int fats;
  final int protein;
  final int carbs;
  final List<Tag> tags;
  final List<String> images;
  final List<Allergen> allergens;

  Product({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.shelfLife,
    required this.portion,
    required this.price,
    required this.dietType,
    required this.productType,
    required this.weight,
    required this.calories,
    required this.fats,
    required this.protein,
    required this.carbs,
    required this.tags,
    required this.images,
    required this.allergens,
  });

  factory Product.initial() => Product(
    id: Uuid().v4(),
    productName: '',
    productDescription: '',
    shelfLife: 3,
    portion: 2,
    price: 200,
    dietType: DietType.nonvegetarian,
    productType: '',
    weight: 500,
    calories: 450,
    fats: 240,
    protein: 340,
    carbs: 400,
    tags: [],
    images: [],
    allergens: [],
  );

  Product copyWith({
    String? id,
    String? productName,
    String? productDescription,
    int? shelfLife,
    int? portion,
    int? price,
    DietType? dietType,
    String? productType,
    int? weight,
    int? calories,
    int? fats,
    int? protein,
    int? carbs,
    List<Tag>? tags,
    List<String>? images,
    List<Allergen>? allergens,
  }) {
    return Product(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      shelfLife: shelfLife ?? this.shelfLife,
      portion: portion ?? this.portion,
      price: price ?? this.price,
      dietType: dietType ?? this.dietType,
      productType: productType ?? this.productType,
      weight: weight ?? this.weight,
      calories: calories ?? this.calories,
      fats: fats ?? this.fats,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      tags: tags ?? this.tags,
      images: images ?? this.images,
      allergens: allergens ?? this.allergens,
    );
  }
}
