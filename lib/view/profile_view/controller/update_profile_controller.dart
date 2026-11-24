// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api_urls.dart';
import '../../../constant/local_storage.dart';
import '../../../utils/custom_toast_message.dart';
import 'get_profile_controller.dart';

class UpdateProfileController extends GetxController {

  var isLoading = false.obs;

  final StorageService _storageService = StorageService();

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String address,
  }) async {
    try {
      isLoading(true);

      String token = _storageService.read<String>('access_token') ?? '';

      /// map --- key -- value
      var body = {
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
      };

      print("body =========== $body");

      var response = await http.put(
        Uri.parse(ApiUrl.profile),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      /// json ta k venge use korben jsonDecode()
      var responseBody = jsonDecode(response.body);

      if (responseBody['success'] == true) {
        CustomToast.showToast(responseBody['message'] ?? "Profile updated successfully");

        /// profile abar load kori jate notun data dekhay
        await Get.find<GetProfileController>().getProfile();

        Get.back();
      } else {
        String errorMessage = responseBody['message'] ?? 'Profile update failed';
        CustomToast.showToast(errorMessage, isError: true);
      }
    } catch (error) {
      CustomToast.showToast(
        "Something went wrong. Please check your connection.",
        isError: true,
      );
      print("Update profile error: $error");
    } finally {
      isLoading(false);
    }
  }
}
