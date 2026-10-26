import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/view/splash_view/splash_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Batch Task',
      home: SplashScreen(),
    );
  }
}
