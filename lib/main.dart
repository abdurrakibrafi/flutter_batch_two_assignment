import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/view/navigation_menu/navigation_menu.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Batch Task',
      home: NavigationMenu(),
    );
  }
}
