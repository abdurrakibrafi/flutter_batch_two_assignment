import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_batch_two_assignment/view/home_view/home_view.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/proflle_view.dart';
import 'package:flutter_batch_two_assignment/view/home_view/widgets/custom_bottom_nav.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/controller/get_profile_controller.dart';
import 'package:flutter_batch_two_assignment/view/task_view/add_task_view.dart';
import 'package:flutter_batch_two_assignment/view/task_view/controller/create_task_controller.dart';
import 'package:flutter_batch_two_assignment/view/task_view/controller/delete_task_controller.dart';
import 'package:flutter_batch_two_assignment/view/task_view/controller/get_all_task_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  /// Home ar Add Task screen e ei controller gula share kori
  final GetAllTaskController getAllTaskController = Get.put(GetAllTaskController());
  final CreateTaskController createTaskController = Get.put(CreateTaskController());
  final DeleteTaskController deleteTaskController = Get.put(DeleteTaskController());
  final GetProfileController getProfileController = Get.put(GetProfileController());

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
