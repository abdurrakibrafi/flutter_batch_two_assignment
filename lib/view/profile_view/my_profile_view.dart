import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../utils/custom_loader.dart';
import 'controller/get_profile_controller.dart';
import 'edit_profile_view.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/profile_info_row.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final local = date.toLocal();
    return '${local.day} ${months[local.month - 1]} ${local.year}';
  }

  @override
  Widget build(BuildContext context) {
    final GetProfileController controller = Get.find<GetProfileController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
            size: 18,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: AppColors.primary),
            onPressed: () => Get.to(() => const EditProfileView()),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.profileData.value.uuid == null) {
          return const Center(child: CustomLoader());
        }

        final profile = controller.profileData.value;

        return RefreshIndicator(
          color: AppColors.primary,
          onRefresh: controller.getProfile,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ProfileAvatar(profile: profile, radius: 50),
                const SizedBox(height: 14),

                // Name + verified badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        profile.fullName.isEmpty ? 'Unknown User' : profile.fullName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    if (profile.isVerified == true) ...[
                      const SizedBox(width: 6),
                      const Icon(Icons.verified, color: AppColors.primary, size: 20),
                    ],
                  ],
                ),
                const SizedBox(height: 10),

                // Verified status chip
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: profile.isVerified == true ? AppColors.lightGreen : Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    profile.isVerified == true ? 'Verified Account' : 'Not Verified',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: profile.isVerified == true ? AppColors.primary : Colors.orange,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Personal info card
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  child: Column(
                    children: [
                      ProfileInfoRow(
                        icon: Icons.person_outline,
                        label: 'First Name',
                        value: (profile.firstName ?? '').isEmpty ? '-' : profile.firstName!,
                      ),
                      const Divider(height: 1),
                      ProfileInfoRow(
                        icon: Icons.person_outline,
                        label: 'Last Name',
                        value: (profile.lastName ?? '').isEmpty ? '-' : profile.lastName!,
                      ),
                      const Divider(height: 1),
                      ProfileInfoRow(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: profile.gmail ?? '-',
                      ),
                      const Divider(height: 1),
                      ProfileInfoRow(
                        icon: Icons.location_on_outlined,
                        label: 'Address',
                        value: (profile.address ?? '').isEmpty ? '-' : profile.address!,
                      ),
                      const Divider(height: 1),
                      ProfileInfoRow(
                        icon: Icons.calendar_today_outlined,
                        label: 'Member Since',
                        value: _formatDate(profile.createAt),
                      ),
                      const Divider(height: 1),
                      ProfileInfoRow(
                        icon: Icons.update,
                        label: 'Last Updated',
                        value: _formatDate(profile.updateAt),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
