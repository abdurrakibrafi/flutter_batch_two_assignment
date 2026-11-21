import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_batch_two_assignment/constant/app_colors.dart';
import 'package:flutter_batch_two_assignment/utils/custom_loader.dart';
import 'package:flutter_batch_two_assignment/view/home_view/widgets/home_header.dart';
import 'package:flutter_batch_two_assignment/view/home_view/widgets/task_card.dart';
import 'package:flutter_batch_two_assignment/view/task_view/controller/task_controller.dart';
import 'package:flutter_batch_two_assignment/view/task_view/model/task_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void _confirmDelete(TaskController controller, TaskModel task) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Delete Task?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          '"${task.title}" will be permanently deleted. This can\'t be undone.',
          style: const TextStyle(color: AppColors.textSecondary, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              controller.deleteTask(task.id);
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find<TaskController>();

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'My Tasks',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Obx(
                    () => taskController.totalRecords.value == 0
                        ? const SizedBox.shrink()
                        : Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${taskController.totalRecords.value}',
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (taskController.isLoading.value &&
                    taskController.tasks.isEmpty) {
                  return const CustomLoader();
                }

                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: taskController.fetchTasks,
                  child: taskController.tasks.isEmpty
                      ? const _EmptyTasks()
                      : NotificationListener<ScrollNotification>(
                          // list er sheshe ashle next page load kori
                          onNotification: (notification) {
                            if (notification.metrics.extentAfter < 300) {
                              taskController.loadMore();
                            }
                            return false;
                          },
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            itemCount:
                                taskController.tasks.length +
                                (taskController.hasNext.value ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index == taskController.tasks.length) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: CustomLoader(size: 30),
                                );
                              }
                              final task = taskController.tasks[index];
                              return Obx(
                                () => TaskCard(
                                  key: ValueKey(task.id),
                                  title: task.title,
                                  description: task.content,
                                  status: task.status,
                                  isDeleting: taskController.deletingIds
                                      .contains(task.id),
                                  onDelete: () =>
                                      _confirmDelete(taskController, task),
                                ),
                              );
                            },
                          ),
                        ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyTasks extends StatelessWidget {
  const _EmptyTasks();

  @override
  Widget build(BuildContext context) {
    // ListView rakhlam jate pull-to-refresh empty state eo kaj kore
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: [
        const SizedBox(height: 80),
        Container(
          height: 90,
          width: 90,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.lightGreen,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.task_alt, size: 44, color: AppColors.primary),
        ),
        const SizedBox(height: 20),
        const Text(
          'No tasks yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tap "Add Task" below to create your first task.',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
