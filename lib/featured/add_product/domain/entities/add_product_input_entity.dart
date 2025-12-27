import 'dart:io';

import 'package:fruits_dash_board/featured/add_product/domain/entities/review_entity.dart';

class AddProductInputEntity {
  final String name;
  final String description;
  final num price;
  final String code;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonth;
   bool isOrganic;
  final int numberOfCalories;
   final num averageRating = 0;
  final int ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews ;





  AddProductInputEntity( {
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
     this.isOrganic = false,
    required this.reviews,

  });
}
