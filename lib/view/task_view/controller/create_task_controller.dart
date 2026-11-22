// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api_urls.dart';
import '../../../constant/local_storage.dart';
import '../../../utils/custom_toast_message.dart';
import '../model/task_model.dart';
import 'get_all_task_controller.dart';

class CreateTaskController extends GetxController {

  var isLoading = false.obs;

  final StorageService _storageService = StorageService();

  /// success hole true return kore, jate view form clear korte pare
  Future<bool> createTask({
    required String title,
    required String content,
    required TaskStatus status,
  }) async {
    try {
      isLoading(true);


      /// map --- key -- value
      var body = {
        "title": title,
        "content": content,
        "status": status.apiValue,
      };


      print("body =========== $body");


      String token = _storageService.read<String>('access_token') ?? '';

      var response = await http.post(
        Uri.parse(ApiUrl.tasks),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      /// json ta k venge use korben jsonDecode()
      var responseBody = jsonDecode(response.body);

      print("create task ========== ${response.statusCode} ${response.body}");


      if (responseBody['success'] == true) {
        CustomToast.showToast(
          responseBody['message'] ?? "Task created successfully",
        );

        /// notun task list e dekhanor jonno abar load kori
        Get.find<GetAllTaskController>().fetchTasks();

        return true;
      } else {
        String errorMessage = responseBody['message'] ?? 'Failed to create task';
        CustomToast.showToast(errorMessage, isError: true);

        return false;
      }
    } catch (error) {
      CustomToast.showToast(
        "Something went wrong. Please check your connection.",
        isError: true,
      );
      print("Create task error: $error");
      return false;
    } finally {
      isLoading(false);
    }
  }
}
