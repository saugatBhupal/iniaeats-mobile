import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';

class SwitchMealTabUsecase implements UsecaseWithParams<List<Product>, String> {
  @override
  Future<Either<Failure, List<Product>>> call(String tag) async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/product.data');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<Product> allProducts = jsonList.map((e) => Product.fromJson(e)).toList();

      final List<Product> filtered =
          allProducts.where((p) {
            return p.tags.any((t) => t.name.toLowerCase().contains(tag));
          }).toList();

      return Right(filtered);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
