import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dash_board/featured/add_product/presentation/manager/add_product_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/box_error.dart';
import '../../manager/add_product_state.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          ShowBoxError.show(context, 'Product added successfully' ,message: 'Success');
        }
        if (state is AddProductFailure) {
          ShowBoxError.show(context, state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddProductLoading,
            child: AddProductViewBody());
      },
    );
  }
}