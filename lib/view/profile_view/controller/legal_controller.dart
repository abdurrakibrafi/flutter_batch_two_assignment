import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/custom_toast_message.dart';
import '../model/legel_model.dart';

class LegalController extends GetxController {
  var isLoading = false.obs;
  var legalData = LegalModel().obs;

  Future<void> fetchLegalContent(String url) async {
    try {
      isLoading(true);
      // Reset data before fetching
      legalData.value = LegalModel();

      var response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      var responseBody = jsonDecode(response.body);

      if (responseBody['success'] == true) {
        legalData.value = LegalModel.fromJson(responseBody);
      } else {
        String errorMessage = responseBody['message'] ?? 'Failed to fetch content';
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
