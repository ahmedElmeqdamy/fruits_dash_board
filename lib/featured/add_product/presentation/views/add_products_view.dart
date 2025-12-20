import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dash_board/featured/add_product/presentation/views/widgets/add_product_view_body.dart';

import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../../../core/services/get_it_service.dart';
import '../manager/add_product_cubit.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('product_view ')),
      body: BlocProvider(
        create: (context) =>
            AddProductCubit(getIt.get<ImageRepo>(), getIt.get<ProductRepo>()),
        child: AddProductViewBody(),
      ),
    );
  }
}
