import 'package:flutter/material.dart';
import 'package:fruits_dash_board/featured/add_product/presentation/views/add_products_view.dart';

import '../../featured/dash_board/presentation/dash_board_view.dart';

//create on generate Route function 1-2 go to main to see section 2
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'dashBoardView':
      return MaterialPageRoute(builder: (context) => const DashBoardView());
    case 'addProductView':
      return MaterialPageRoute(builder: (context) => const AddProductsView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
