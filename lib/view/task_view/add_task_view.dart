import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../utils/custom_loader.dart';
import '../../utils/custom_toast_message.dart';
import '../../utils/cutom_text_filed.dart';
import '../../utils/primary_button.dart';
import 'controller/create_task_controller.dart';
import 'model/task_model.dart';

class AddTaskView extends StatefulWidget {
  /// task create hoye gele call hoy (jemon: My Tasks tab e niye jaoa)
  final VoidCallback? onTaskCreated;

  const AddTaskView({super.key, this.onTaskCreated});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final CreateTaskController createTaskController = Get.find<CreateTaskController>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  TaskStatus selectedStatus = TaskStatus.pending;

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final title = titleController.text.trim();
    final content = contentController.text.trim();

    if (title.isEmpty) {
      CustomToast.showToast("Please enter a task title", isError: true);
      return;
    }

    FocusScope.of(context).unfocus();

    final created = await createTaskController.createTask(
      title: title,
      content: content,
      status: selectedStatus,
    );

    if (created) {
      titleController.clear();
      contentController.clear();
      setState(() => selectedStatus = TaskStatus.pending);
      widget.onTaskCreated?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Create New Task',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Add a title and a short description to stay on track.',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 28),
                CustomTextField(
                  label: 'Task Title',
                  hint: 'e.g. Design landing page header',
                  controller: titleController,
                ),
                const SizedBox(height: 18),
                CustomTextField(
                  label: 'Description (optional)',
                  hint: 'Describe what needs to be done...',
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                ),
                const SizedBox(height: 18),
                const Text(
                  'Status',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: TaskStatus.values.map((status) {
                    final isSelected = status == selectedStatus;
                    return ChoiceChip(
                      label: Text(status.label),
                      selected: isSelected,
                      showCheckmark: false,
                      onSelected: (_) =>
                          setState(() => selectedStatus = status),
                      backgroundColor: AppColors.lightGreen,
                      selectedColor: status.color,
                      side: BorderSide(
                        color: isSelected ? status.color : Colors.transparent,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : AppColors.textPrimary,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 32),
                Obx(
                  () => createTaskController.isLoading.value
                      ? const SizedBox(
                          height: 48,
                          child: CustomLoader(size: 36),
                        )
                      : PrimaryButton(
                          title: 'Create Task',
                          showArrow: false,
                          onPressed: _submit,
                        ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
