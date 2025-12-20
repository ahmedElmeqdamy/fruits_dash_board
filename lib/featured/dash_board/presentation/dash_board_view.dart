import 'package:flutter/material.dart';
import 'package:fruits_dash_board/featured/dash_board/presentation/views/dash_board_view_body.dart';
class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const DashBoardViewBody(),
    );
  }
}
