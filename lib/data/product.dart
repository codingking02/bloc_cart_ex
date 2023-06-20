import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  int? index;
  String? name;
  Color? color;
  Product({required this.name, required this.color});

  @override
  // TODO: implement props
  List<Object?> get props => [index, name, color];
}
