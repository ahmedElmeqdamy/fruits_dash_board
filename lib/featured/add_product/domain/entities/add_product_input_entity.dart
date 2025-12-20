import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String description;
  final num price;
  final String code;
  final File image;
  final bool isFeatured;
   String? imageUrl;

  AddProductInputEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.image,
    required this.isFeatured,  this.imageUrl,
  });
}
