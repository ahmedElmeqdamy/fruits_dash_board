
import 'package:dartz/dartz.dart';

import '../../../featured/add_product/domain/entities/add_product_input_entity.dart';
import '../../errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(AddProductInputEntity addProductInputEntity);
}