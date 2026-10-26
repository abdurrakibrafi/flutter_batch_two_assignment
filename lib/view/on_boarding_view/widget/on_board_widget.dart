
import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String number;

  const OnboardingPageWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.number,
  });

  static const Color primaryColor = Color(0xFF84C900);
  static const Color darkColor = Color(0xFF172033);
  static const Color greyColor = Color(0xFF777F8C);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Illustration
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

        // Page Number
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

        // Title
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

        // Description
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
}
