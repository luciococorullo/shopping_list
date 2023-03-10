import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list/costants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Error screen'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('ERROR 404 PAGE NOT FOUND'),
              ElevatedButton(
                  onPressed: () => context.goNamed(homeRoute),
                  child: const Text('Return to root'))
            ]),
      ),
    );
  }
}
