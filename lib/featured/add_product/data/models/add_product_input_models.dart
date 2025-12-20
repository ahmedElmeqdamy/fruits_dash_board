import 'dart:io';

import 'package:fruits_dash_board/featured/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModels {
  final String name;
  final String description;
  final num price;
  final String code;
  final File image;
  final bool isFeatured;
  String? imageUrl;

  AddProductInputModels({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.image,
    required this.isFeatured, this.imageUrl,
  });

  factory AddProductInputModels.fromEntity (
      AddProductInputEntity addProductInputEntity){
    return AddProductInputModels(name: addProductInputEntity.name,
        description: addProductInputEntity.description,
        price: addProductInputEntity.price,
        code: addProductInputEntity.code,
        image: addProductInputEntity.image,
        isFeatured: addProductInputEntity.isFeatured);
  }

  toJson(){
    return {
      'name' : name ,
      'description' : description,
      'price' : price,
      'code' : code,
      'isFeatured' : isFeatured,
      'imageUrl' : imageUrl,
    };
  }
}
