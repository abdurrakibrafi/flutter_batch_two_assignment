// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api_urls.dart';
import '../../../constant/local_storage.dart';
import '../../../utils/custom_toast_message.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final StorageService _storageService = StorageService();

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading(true);

      var map = {"gmail": email, "password": password};

      var response = await http.post(
        Uri.parse(ApiUrl.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(map),
      );

      var responseBody = jsonDecode(response.body);

      print("Response body =========== $responseBody");

      if (responseBody['success'] == true) {
        String accessToken = responseBody['data']['access_token'];
        String id = responseBody['data']['user']['uuid'];

        await _storageService.write('access_token', accessToken);
        await _storageService.write('uuid', id);

        CustomToast.showToast(responseBody['message']);
      } else {
        String errorMessage = responseBody['message'] ?? 'Login failed';
        CustomToast.showToast(errorMessage, isError: true);
      }
    } catch (e) {
      CustomToast.showToast(
        "Something went wrong. Please check your connection.",
        isError: true,
      );
      print("Login error: $e");
    } finally {
      isLoading(false);
    }
  }
}
