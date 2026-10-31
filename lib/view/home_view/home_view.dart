import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/view/home_view/widgets/home_header.dart';
import 'package:flutter_batch_two_assignment/view/home_view/widgets/task_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'My Tasks',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  TaskCard(
                    title: 'Design Landing Page Header',
                    description:
                        'Create a clean, responsive header section with logo, navigation links, and a clear call-to-action button.',
                  ),
                  TaskCard(
                    title: 'Develop Onboarding Screens',
                    description:
                        'Design a 3-step onboarding flow to introduce users to core app features using illustrations and concise text.',
                  ),
                  TaskCard(
                    title: 'Organize Task Card Components',
                    description:
                        'Build reusable task card UI elements for listing, prioritizing, and editing individual tasks.',
                  ),
                  TaskCard(
                    title: 'Prepare Terms & Privacy Pages',
                    description:
                        'Create UI layouts for Terms & Conditions and Privacy Policy using scrollable content and soft brand styling.',
                  ),
                  TaskCard(
                    title: 'Build Calendar View Layout',
                    description:
                        'Design a visual calendar interface to display upcoming tasks and deadlines with status indicators.',
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
