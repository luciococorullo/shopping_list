import 'package:flutter/material.dart';
import 'package:shopping_list/models/cubit/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartList();
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        state.maybeWhen(
            success: (products) => ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Cart updated 😍'))),
            orElse: () {});
        state.maybeWhen(
          error: (error, products) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error))),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Container(
          child: state.when(
            initial: (products) => const Text("nessun prodotto aggiunto"),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (products) => ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].title),
                  subtitle: Text(products[index].price.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => context
                        .read<CartCubit>()
                        .removeProduct(products[index]),
                  ),
                );
              },
            ),
            error: (error, products) => Center(
              child: Text('error: $error'),
            ),
          ),
        );
      },
    );
  }
}
