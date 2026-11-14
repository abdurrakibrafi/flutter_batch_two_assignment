import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api_urls.dart';
import '../../../utils/custom_toast_message.dart';
import '../login_view.dart';

class OtpController extends GetxController {
  var isLoading = false.obs;

  Future<void> verifyOtp({
    required String email,
    required String otp,
    required String purpose,
  }) async {
    try {
      isLoading(true);
      var body = {
        "gmail": email,
        "otp": otp,
        "purpose": purpose,
      };

      var response = await http.post(
        Uri.parse(ApiUrl.verifyOtp),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      var responseBody = jsonDecode(response.body);

      if (responseBody['success'] == true) {
        CustomToast.showToast("OTP Verified Successfully");
        Get.offAll(() => const LoginScreen());
      } else {
        String errorMessage = responseBody['message'] ?? 'OTP verification failed';
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
