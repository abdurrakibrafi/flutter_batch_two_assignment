
import 'package:flutter/material.dart';
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

  void _goToLogin() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
          (route) => false,
    );
  }

  void _nextPage() {
    if (currentPage == 2) {
      _goToLogin();
    } else {
      _introKey.currentState?.next();
    }
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
    required String number,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Illustration Background
        Container(
          height: 280,
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: const Color(0xFFF7FCEB),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.task_alt_rounded,
                size: 110,
                color: primaryColor,
              );
            },
          ),
        ),

        const SizedBox(height: 35),

        // Page number
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F9DE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'STEP $number OF 03',
            style: const TextStyle(
              color: primaryColor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 18),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: darkColor,
            height: 1.25,
          ),
        ),

        const SizedBox(height: 14),

        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: greyColor,
            height: 1.7,
          ),
        ),
      ],
    );
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
                  bodyWidget: _buildPage(
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
                  bodyWidget: _buildPage(
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
                  bodyWidget: _buildPage(
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

              onDone: _goToLogin,
              onSkip: _goToLogin,

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
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
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
                    onPressed: _goToLogin,
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
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      final isActive = currentPage == index;

                      return AnimatedContainer(
                        duration:
                        const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        height: 7,
                        width: isActive ? 28 : 7,
                        decoration: BoxDecoration(
                          color: isActive
                              ? primaryColor
                              : const Color(0xFFE1E5E9),
                          borderRadius:
                          BorderRadius.circular(10),
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
                          borderRadius:
                          BorderRadius.circular(14),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            currentPage == 2
                                ? 'Get Started'
                                : 'Next',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 20,
                          ),
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
      bodyPadding: EdgeInsets.only(
        top: 90,
        bottom: 140,
      ),
      contentMargin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      imagePadding: EdgeInsets.zero,
      bodyAlignment: Alignment.center,
    );
  }
}
