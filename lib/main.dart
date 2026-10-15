import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/view/student_portal_view/student_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Batch Task', home: StudentHomeScreen());
  }
}
