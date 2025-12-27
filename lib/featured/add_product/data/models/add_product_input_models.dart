import 'dart:io';

import 'package:fruits_dash_board/featured/add_product/data/models/review_model.dart';
import 'package:fruits_dash_board/featured/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModels {
  final String name;
  final String description;
  final num price;
  final String code;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonth;
  final bool isOrganic ;
  final int numberOfCalories;
  final num averageRating = 0;
  final int ratingCount = 0;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  AddProductInputModels({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonth,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.isOrganic,
    required this.reviews,  this.sellingCount = 0,
  });

  factory AddProductInputModels.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModels(
      isOrganic: addProductInputEntity.isOrganic,
      name: addProductInputEntity.name,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      code: addProductInputEntity.code,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      expirationMonth: addProductInputEntity.expirationMonth,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      reviews: addProductInputEntity.reviews
          .map((value) => ReviewModel.fromEntity(value))
          .toList(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonth': expirationMonth,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((value) => value.toJson()).toList(),
      'sellingCount': sellingCount,
    };
  }
}
