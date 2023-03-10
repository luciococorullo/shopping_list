import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list/models/cubit/cart_cubit.dart';

const items = [
  ExtendedBottomNavigationBarItem(
      initialLocation: '/home', icon: Icon(Icons.home), label: 'Home'),
  ExtendedBottomNavigationBarItem(
      initialLocation: '/cart',
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Cart')
];

class Root extends StatefulWidget {
  const Root({super.key, required this.child});
  final Widget child;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        items.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(items[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mozzarelle scioppp')),
      body: BlocProvider<CartCubit>(
        create: (context) => CartCubit(products: []),
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        onTap: (value) => _onItemTapped(context, value),
      ),
    );
  }
}

class ExtendedBottomNavigationBarItem extends BottomNavigationBarItem {
  const ExtendedBottomNavigationBarItem(
      {required this.initialLocation,
      required Widget icon,
      required String label})
      : super(icon: icon, label: label);

  final String initialLocation;
}
