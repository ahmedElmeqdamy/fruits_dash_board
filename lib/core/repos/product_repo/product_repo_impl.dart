import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_dash_board/core/errors/failure.dart';
import 'package:fruits_dash_board/core/repos/product_repo/product_repo.dart';
import 'package:fruits_dash_board/core/services/database_services.dart';

import '../../../featured/add_product/data/models/add_product_input_models.dart';
import '../../../featured/add_product/domain/entities/add_product_input_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseServices databaseServices;

  ProductRepoImpl(this.databaseServices);

  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    try {
      await databaseServices.addData(
        path: 'products',
        data: AddProductInputModels.fromEntity(addProductInputEntity).toJson(),
      );

      return right(null);
    } catch (error) {
      log('.................._______________________________$error');
      return Left(ServerFailure(error.toString()));
    }
  }
}
