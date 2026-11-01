import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/constant/app_colors.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/widgets/faq_item_widget.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primary,
                size: 18,
              ),
            ),
          ),
        ),
        title: const Text(
          'Help/Support',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FAQs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const FaqItemWidget(
              question: 'How do I create a new task?',
              answer:
                  'Tap the "Add Task" button on the navigation bar. Fill in the task title, due date, priority, and other details — then tap "Save".',
              isInitiallyExpanded: true,
            ),
            const FaqItemWidget(
              question: 'How can I view task details?',
              answer:
                  'To view task details, simply tap on any task card on the "My Tasks" screen. This will open a detailed view of that specific task.',
            ),
            const FaqItemWidget(
              question: 'Can I mark a task as favorite or important?',
              answer:
                  'Yes, when creating or editing a task, you can toggle the "Important" flag to highlight it in your list.',
            ),
            const FaqItemWidget(
              question: 'How do I edit or delete a task?',
              answer:
                  'Swipe left on any task card to reveal the edit and delete options, or tap into the task details and use the menu at the top right.',
            ),
            const FaqItemWidget(
              question: 'Is my data secure?',
              answer:
                  'Your data is encrypted and stored locally on your device. We prioritize your privacy and do not share your information with third parties.',
            ),
            const SizedBox(height: 25),
            const Text(
              'Need More Help?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.headset_mic_outlined,
                      color: AppColors.primary,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: 'Mail Us: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: '(support@taskmanagerapp.com)',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Our help desk is available 24/7 to support your workflow.',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
