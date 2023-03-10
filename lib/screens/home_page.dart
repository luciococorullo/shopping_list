import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/models/cubit/cart_cubit.dart';

import '../models/product/Product.dart';

const List<Product> products = [
  Product(title: 'mozzarella', price: 23.4),
  Product(title: 'bufala', price: 23.4),
  Product(title: 'stocazz', price: 23.4),
  Product(title: 'gelato', price: 23.4),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductList();
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].title),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                BlocProvider.of<CartCubit>(context).addProduct(products[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
