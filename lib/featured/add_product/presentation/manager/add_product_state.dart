

import 'package:flutter/material.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}
final class AddProductLoading extends AddProductState{}
final class AddProductSuccess extends AddProductState{}
final class AddProductFailure extends AddProductState{
  final String error;
  AddProductFailure(this.error);
}


