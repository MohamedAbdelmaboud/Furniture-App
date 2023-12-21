import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubits/cart_cubit/cart_states.dart';
import 'package:shop/models/product_model.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartIntialState());
  List<ProductModel> cartProducts = [];
  List<Color> colors = [];
  add(ProductModel productModel) {
    emit(CartLoadingState());
    cartProducts.add(productModel);
    emit(CartAddedState());
  }
}
