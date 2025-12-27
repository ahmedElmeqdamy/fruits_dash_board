import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dash_board/featured/add_product/domain/entities/add_product_input_entity.dart';

import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
    : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductInputEntity.image);
    result.fold((l) {

      emit(AddProductFailure(l.message+'\n- error in upload image'));
    }, (url) async {
      addProductInputEntity.imageUrl = url;

      var result = await productRepo.addProduct(addProductInputEntity);
      result.fold((l) {
        emit(AddProductFailure(l.message+'\n- error in add product'));
      }, (r) {
        emit(AddProductSuccess());
      });
    });
  }
}
