import 'dart:convert';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';

class GetRecommendedProductsUsecase implements UsecaseWithoutParams<List<Product>> {
  @override
  Future<Either<Failure, List<Product>>> call() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/product.data');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<Product> allProducts = jsonList.map((e) => Product.fromJson(e)).toList();
      final random = Random();
      final List<Product> recommended = List.generate(
        3,
        (_) => allProducts[random.nextInt(allProducts.length)],
      );

      return Right(recommended);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
