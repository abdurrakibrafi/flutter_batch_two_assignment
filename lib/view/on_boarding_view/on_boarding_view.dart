import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/view/on_boarding_view/widget/on_board_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../auth_view/login_view.dart';

class OnBordView extends StatefulWidget {
  const OnBordView({super.key});

  @override
  State<OnBordView> createState() => _OnBordViewState();
}

class _OnBordViewState extends State<OnBordView> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  static const Color primaryColor = Color(0xFF84C900);
  static const Color darkColor = Color(0xFF172033);
  static const Color greyColor = Color(0xFF777F8C);

  int currentPage = 0;

  void _nextPage() {
    if (currentPage == 2) {
      Get.off(LoginScreen());
    } else {
      _introKey.currentState?.next();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            IntroductionScreen(
              key: _introKey,
              globalBackgroundColor: Colors.white,

              pages: [
                PageViewModel(
                  titleWidget: const SizedBox.shrink(),
                  bodyWidget: OnboardingPageWidget(
                    image: 'assets/images/onboarding_1.png',
                    number: '01',
                    title: 'Manage Everything\nin One Place',
                    description:
                        'Create, organize, and manage all your '
                        'personal and work tasks effortlessly. '
                        'Everything you need is right here.',
                  ),
                  decoration: _pageDecoration(),
                ),

                PageViewModel(
                  titleWidget: const SizedBox.shrink(),
                  bodyWidget: OnboardingPageWidget(
                    image: 'assets/images/onboarding_2.png',
                    number: '02',
                    title: 'Focus on What\nMatters Most',
                    description:
                        'Set priorities, manage deadlines, and '
                        'stay focused on the tasks that help '
                        'you achieve your goals.',
                  ),
                  decoration: _pageDecoration(),
                ),

                PageViewModel(
                  titleWidget: const SizedBox.shrink(),
                  bodyWidget: OnboardingPageWidget(
                    image: 'assets/images/onboarding_3.png',
                    number: '03',
                    title: 'Visualize Progress,\nStay on Track',
                    description:
                        'Track completed tasks, monitor your '
                        'progress, and reach your goals with '
                        'a clear and organized workflow.',
                  ),
                  decoration: _pageDecoration(),
                ),
              ],

              onChange: (index) {
                setState(() {
                  currentPage = index;
                });
              },

              onDone: () {
                Get.off(() => LoginScreen());
              },
              onSkip: () {
                Get.off(() => LoginScreen());
              },

              showNextButton: false,
              showDoneButton: false,
              showSkipButton: false,
              showBottomPart: false,

              animationDuration: 350,
              curve: Curves.easeInOut,
            ),

            // Top Navigation
            Positioned(
              top: 12,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (currentPage > 0) {
                        _introKey.currentState?.previous();
                      } else {
                        Navigator.maybePop(context);
                      }
                    },
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F8FA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 17,
                        color: darkColor,
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Get.off(() => LoginScreen());
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Section
            Positioned(
              bottom: 20,
              left: 24,
              right: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Custom animated dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      final isActive = currentPage == index;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 7,
                        width: isActive ? 28 : 7,
                        decoration: BoxDecoration(
                          color: isActive
                              ? primaryColor
                              : const Color(0xFFE1E5E9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 35),

                  // Next / Get Started Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentPage == 2 ? 'Get Started' : 'Next',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_forward_rounded, size: 20),
                        ],
                      ),
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

  PageDecoration _pageDecoration() {
    return const PageDecoration(
      pageColor: Colors.white,
      titlePadding: EdgeInsets.zero,
      bodyPadding: EdgeInsets.only(top: 90, bottom: 140),
      contentMargin: EdgeInsets.symmetric(horizontal: 24),
      imagePadding: EdgeInsets.zero,
      bodyAlignment: Alignment.center,
    );
  }
}
