import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../constant/app_colors.dart';
import '../model/profile_model.dart';

/// base64Image thakle seta dekhabe, na thakle name er first letter
class ProfileAvatar extends StatelessWidget {
  final ProfileData profile;
  final double radius;

  const ProfileAvatar({super.key, required this.profile, this.radius = 45});

  @override
  Widget build(BuildContext context) {
    final image = profile.base64Image ?? '';
    if (image.isNotEmpty) {
      try {
        final bytes = base64Decode(image.contains(',') ? image.split(',').last : image);
        return CircleAvatar(radius: radius, backgroundImage: MemoryImage(bytes));
      } catch (_) {}
    }

    final initials = [profile.firstName, profile.lastName]
        .where((e) => e != null && e.isNotEmpty)
        .map((e) => e![0].toUpperCase())
        .join();

    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.lightGreen,
      child: Text(
        initials.isEmpty ? '?' : initials,
        style: TextStyle(
          fontSize: radius * 0.6,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
