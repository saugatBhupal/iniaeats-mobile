import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_extensions.dart';
import 'package:inaeats/src/features/categories/domain/entities/product_catergory.dart';
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
  // final List<String> images;
  // final List<Allergen> allergens;
  final List<ProductCategory> categories;
  // final String recipeVideo;
  // final bool requiresHeating;
  final int duration;
  // final Difficulty difficulty;

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
    // required this.images,
    // required this.allergens,
    required this.categories,
    // required this.recipeVideo,
    // required this.requiresHeating,
    required this.duration,
    // required this.difficulty,
  });

  factory Product.initial() => Product(
    id: Uuid().v4(),
    productName: '',
    productDescription: '',
    shelfLife: 3,
    portion: 2,
    price: 200,
    dietType: DietType.nonvegetarian,
    productType: 'Meal Kit',
    weight: 500,
    calories: 450,
    fats: 240,
    protein: 340,
    carbs: 400,
    tags: [],
    // images: [],
    // allergens: [],
    categories: [],
    // recipeVideo: '',
    // requiresHeating: false,
    duration: 0,
    // difficulty: Difficulty.easy,
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
    List<ProductCategory>? categories,
    String? recipeVideo,
    bool? requiresHeating,
    int? duration,
    Difficulty? difficulty,
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
      // images: images ?? this.images,
      // allergens: allergens ?? this.allergens,
      categories: categories ?? this.categories,
      // recipeVideo: recipeVideo ?? this.recipeVideo,
      // requiresHeating: requiresHeating ?? this.requiresHeating,
      duration: duration ?? this.duration,
      // difficulty: difficulty ?? this.difficulty,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: const Uuid().v4(),
    productType: json['productType'],
    productName: json['productName'],
    productDescription: json['productDescription'],
    shelfLife: json['shelfLife'],
    portion: json['portion'],
    dietType: DietTypeExtension.fromDatabaseValue(json['dietType'].toString()),
    price: json['price'],
    weight: json['weight'],
    calories: json['calories'],
    fats: json['fats'],
    protein: json['protein'],
    carbs: json['carbs'],
    tags: (json['tags'] ?? []).map<Tag>((e) => Tag.initial().copyWith(name: e)).toList(),
    categories:
        (json['categories'] as List<dynamic>? ?? [])
            .map(
              (categoryName) => ProductCategory.initial().copyWith(name: categoryName.toString()),
            )
            .toList(),

    // recipeVideo: json['recipeVideo'],
    // requiresHeating: json['requiresHeating'],
    duration: json['duration'],
    // difficulty: Difficulty.values.firstWhere(
    //   (e) => e.name.toUpperCase() == json['difficulty'].toString().toUpperCase(),
    //   orElse: () => Difficulty.easy,
    // ),
    // images: List<String>.from(json['images'] ?? []),
    // allergens:
    //     (json['allergens'] ?? [])
    //         .map((allergen) => Allergen.initial().copyWith(name: allergen.toString()))
    //         .toList(),
  );
}
