import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/constant/api_urls.dart';
import 'package:flutter_batch_two_assignment/constant/app_colors.dart';
import 'package:flutter_batch_two_assignment/constant/local_storage.dart';
import 'package:flutter_batch_two_assignment/utils/custom_loader.dart';
import 'package:flutter_batch_two_assignment/view/auth_view/login_view.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/controller/get_profile_controller.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/help_support_view.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/legal_view.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/edit_profile_view.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/my_profile_view.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/widgets/profile_avatar.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/widgets/profile_menu_item.dart';
import 'package:get/get.dart';

class ProflleView extends StatelessWidget {
  const ProflleView({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text("Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () async {
                /// logout e shudhu access token remove kori
                await StorageService().remove('access_token');

                /// login screen e niye jai, pichoner sob page remove kore
                Get.offAll(() => LoginScreen());
                Get.snackbar(
                  "Logged Out",
                  "You have been successfully logged out",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GetProfileController controller = Get.find<GetProfileController>();

    return Obx(() {
      if (controller.isLoading.value &&
          controller.profileData.value.uuid == null) {
        return const CustomLoader();
      }

      final profile = controller.profileData.value;

      return RefreshIndicator(
        color: AppColors.primary,
        onRefresh: controller.getProfile,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Cover Image
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 190,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/profile_cover.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    // Profile Image
                    Positioned(
                      top: 140,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ProfileAvatar(profile: profile),
                      ),
                    ),
                  ],
                ),
              ),

              // Name + verified badge
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        profile.fullName.isEmpty
                            ? 'Unknown User'
                            : profile.fullName,
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
                      const Icon(
                        Icons.verified,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                profile.gmail ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// profile er details alada page e dekhabe
                    ProfileMenuItem(
                      icon: Icons.person_outline,
                      title: 'My Profile',
                      onTap: () => Get.to(() => const MyProfileView()),
                    ),

                    const SizedBox(height: 15),
                    const Text(
                      'More',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 15),

                    /// terms and conditions dekhabe
                    ProfileMenuItem(
                      icon: Icons.description_outlined,
                      title: 'Terms & Condition',
                      onTap: () {
                        Get.to(
                          () => const LegalView(
                            title: 'Terms & Condition',
                            apiUrl: ApiUrl.termsAndConditions,
                          ),
                        );
                      },
                    ),

                    /// eikhane click korle amk privacy policy dekhabe
                    ProfileMenuItem(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy policy',
                      onTap: () {
                        Get.to(
                          () => const LegalView(
                            title: 'Privacy policy',
                            apiUrl: ApiUrl.privacyPolicy,
                          ),
                        );
                      },
                    ),

                    ProfileMenuItem(
                      icon: Icons.help_outline,
                      title: 'Help/Support',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpSupportView(),
                          ),
                        );
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.logout,
                      title: 'Log Out',
                      iconColor: Colors.red,
                      onTap: () => _showLogoutDialog(context),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
