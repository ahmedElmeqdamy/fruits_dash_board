import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';
import '../../services/storeage_services.dart';
import 'image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageServices storageServices;

  ImageRepoImpl(this.storageServices);

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageServices.uploadFile(image, 'images');
      return Right(url);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
