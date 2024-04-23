import 'package:flutter/material.dart';

import 'product/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Diary App',
      home: SplashView(),
    );
  }
}
