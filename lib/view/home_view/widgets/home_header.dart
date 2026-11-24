import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile_view/controller/get_profile_controller.dart';
import '../../profile_view/widgets/profile_avatar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    /// profile api theke asha name ar email dekhabo
    final GetProfileController profileController = Get.find<GetProfileController>();

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Obx(() {
        final profile = profileController.profileData.value;

        return Row(
          children: [
            ProfileAvatar(profile: profile, radius: 28),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.fullName.isEmpty ? 'Hello' : 'Hello ${profile.fullName}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    profile.gmail ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
