import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/view/counter_view/generel_usages_of_state_view.dart';
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
      home: GeneralUsagesOfStateView(),
    );
  }
}
