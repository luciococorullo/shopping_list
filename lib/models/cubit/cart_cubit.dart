import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_list/models/product/Product.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.products}) : super(CartState.initial(products));
  List<Product> products;

  void addProduct(Product newProduct) async {
    List<Product> updatedProducts = products;

    emit(const CartState.loading());
    try {
      updatedProducts.add(newProduct);
      emit(CartState.success(updatedProducts));
    } on Exception {
      emit(CartState.error('Error', products));
    }
  }

  void removeProduct(Product product) async {
    List<Product> updatedProducts = products;

    emit(const CartState.loading());
    try {
      updatedProducts.remove(product);
      emit(CartState.success(updatedProducts));
    } on Exception {
      emit(CartState.error('Error', products));
    }
  }
}
