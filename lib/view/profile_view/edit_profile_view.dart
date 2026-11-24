import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../utils/custom_loader.dart';
import '../../utils/custom_toast_message.dart';
import '../../utils/cutom_text_filed.dart';
import '../../utils/primary_button.dart';
import 'controller/get_profile_controller.dart';
import 'controller/update_profile_controller.dart';
import 'widgets/profile_avatar.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final UpdateProfileController updateProfileController = Get.put(UpdateProfileController());
  final GetProfileController getProfileController = Get.find<GetProfileController>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// age theke thaka data diye field gula fill kori
    final profile = getProfileController.profileData.value;
    firstNameController.text = profile.firstName ?? '';
    lastNameController.text = profile.lastName ?? '';
    addressController.text = profile.address ?? '';
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty) {
      CustomToast.showToast("First name and last name are required", isError: true);
      return;
    }

    updateProfileController.updateProfile(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      address: addressController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Obx(() => ProfileAvatar(
                    profile: getProfileController.profileData.value,
                    radius: 50,
                  )),
            ),
            const SizedBox(height: 28),
            CustomTextField(
              label: 'First Name',
              hint: 'Enter your first name',
              controller: firstNameController,
            ),
            const SizedBox(height: 18),
            CustomTextField(
              label: 'Last Name',
              hint: 'Enter your last name',
              controller: lastNameController,
            ),
            const SizedBox(height: 18),
            CustomTextField(
              label: 'Address',
              hint: 'Enter your address',
              controller: addressController,
              maxLines: 2,
            ),
            const SizedBox(height: 32),
            Obx(() => updateProfileController.isLoading.value
                ? const CustomLoader(size: 40)
                : PrimaryButton(
                    title: 'Save Changes',
                    showArrow: false,
                    onPressed: _onSave,
                  )),
          ],
        ),
      ),
    );
  }
}
