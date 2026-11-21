import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/view/auth_view/login_view.dart';
import 'package:flutter_batch_two_assignment/view/navigation_menu/navigation_menu.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// token disk e save rakhar jonno storage age init korte hobe
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Batch Task',
      home: LoginScreen(),
    );
  }
}
