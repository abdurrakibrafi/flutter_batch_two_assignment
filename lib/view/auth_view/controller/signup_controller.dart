import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api_urls.dart';
import '../../../utils/custom_toast_message.dart';
import '../otp_view.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String address,
    required String email,
    required String password,
  }) async {
    try {
      isLoading(true);
      var body = {
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "gmail": email,
        "password": password,
      };

      var response = await http.post(
        Uri.parse(ApiUrl.signUp),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      var responseBody = jsonDecode(response.body);

      if (responseBody['success'] == true) {
        CustomToast.showToast("Sign up successful. Please verify OTP.");
        Get.to(() => OtpScreen(email: email, purpose: "VERIFICATION"));
      } else {
        String errorMessage = responseBody['message'] ?? 'Sign up failed';
        CustomToast.showToast(errorMessage, isError: true);
      }
    } catch (error) {
      CustomToast.showToast(
        "Something went wrong. Please check your connection.",
        isError: true,
      );
    } finally {
      isLoading(false);
    }
  }
}
