// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api_urls.dart';
import '../../../constant/local_storage.dart';
import '../../../utils/custom_toast_message.dart';
import '../model/profile_model.dart';

class GetProfileController extends GetxController {

  var isLoading = false.obs;

  final StorageService _storageService = StorageService();

  /// eikhane profile er data thakbe
  var profileData = ProfileData().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      isLoading(true);

      String token = _storageService.read<String>('access_token') ?? '';

      var response = await http.get(
        Uri.parse(ApiUrl.profile),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      /// json ta k venge use korben jsonDecode()
      var responseBody = jsonDecode(response.body);

      print("get profile ========== ${response.statusCode} ${response.body}");

      if (responseBody['success'] == true) {
        ProfileModel profileModel = ProfileModel.fromJson(responseBody);
        profileData.value = profileModel.data ?? ProfileData();
      } else {
        String errorMessage = responseBody['message'] ?? 'Failed to load profile';
        CustomToast.showToast(errorMessage, isError: true);
      }
    } catch (error) {
      CustomToast.showToast(
        "Something went wrong. Please check your connection.",
        isError: true,
      );
      print("Get profile error: $error");
    } finally {
      isLoading(false);
    }
  }
}
