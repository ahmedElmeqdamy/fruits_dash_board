import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dash_board/core/widgets/custom_button.dart';
import 'package:fruits_dash_board/featured/add_product/domain/entities/add_product_input_entity.dart';

import '../../../../../core/widgets/box_error.dart';
import '../../../../../core/widgets/custom_text_form.dart';
import '../../manager/add_product_cubit.dart';
import 'image_feild.dart';
import 'is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String name;
  late String description;
  late num price;
  late String code;
  File? image;
  late String imageUrl;
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        //we should use stateful widget to save the state of the form
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  hintText: 'product name',
                  onSaved: (value) {
                    name = value!;
                  },
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    description = value!;
                  },
                  hintText: 'product Description',
                  maxLines: 5,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                  hintText: 'product price',
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  },
                  hintText: 'product code',
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                ImageField(
                  onFileChange: (image) {
                    this.image = image;
                  },
                ),
                SizedBox(height: 10),
                IsFeaturedCheckBox(onChanged: (value) {}),
                SizedBox(height: 40),
                CustomButton(
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  text: 'add product please',
                  onPressed: () {
                    if (image != null) {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        AddProductInputEntity input = AddProductInputEntity(
                          name: name,
                          description: description,
                          price: price,
                          code: code,
                          image: image!,
                          isFeatured: isFeatured,
                         // imageUrl: imageUrl,
                        );
                        context.read<AddProductCubit>().addProduct(input);
                      } else {
                        autoValidateMode = AutovalidateMode.onUserInteraction;
                        setState(() {});
                      }
                    } else {
                      ShowBoxError.show(context, 'Please add an image');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
