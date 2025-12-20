import 'package:flutter/material.dart';
import 'package:fruits_dash_board/core/widgets/custom_button.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            text: 'add product',
            onPressed: (){
              Navigator.pushNamed(context, 'addProductView');
            },
          ),
        ],
      ),
    );
  }
}
