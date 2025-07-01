import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';

class SearchProductUsecase implements UsecaseWithParams<List<Product>, String> {
  @override
  Future<Either<Failure, List<Product>>> call(String params) async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/product.data');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<Product> allProducts = jsonList.map((e) => Product.fromJson(e)).toList();
      final List<Product> searchResults =
          allProducts.where((product) {
            final queryLower = params.toLowerCase();
            final matchName = product.productName.toLowerCase().contains(queryLower);
            final matchType = product.productType.toLowerCase().contains(queryLower);
            final matchTags = product.tags.any(
              (tag) => tag.name.toLowerCase().contains(queryLower),
            );
            final matchCategories = product.categories.any(
              (category) => category.name.toLowerCase().contains(queryLower),
            );
            return matchName || matchTags || matchCategories || matchType;
          }).toList();

      print("search results ${searchResults.first.productName}");
      return Right(searchResults);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
