import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_batch_two_assignment/view/home_view/home_view.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/proflle_view.dart';
import 'package:flutter_batch_two_assignment/view/home_view/widgets/custom_bottom_nav.dart';
import 'package:flutter_batch_two_assignment/view/task_view/add_task_view.dart';
import 'package:flutter_batch_two_assignment/view/task_view/controller/task_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  /// Home ar Add Task duita screen e same controller share kori
  final TaskController taskController = Get.put(TaskController());

  late final List<Widget> _screens = [
    const HomeView(),
    AddTaskView(onTaskCreated: () => setState(() => _selectedIndex = 0)),
    const ProflleView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
