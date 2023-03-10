import 'package:flutter/material.dart';
import 'package:shopping_list/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyRouter.router,
      title: 'Router basics',
    );
  }
}
