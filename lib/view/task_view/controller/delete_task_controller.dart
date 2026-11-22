// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api_urls.dart';
import '../../../constant/local_storage.dart';
import '../../../utils/custom_toast_message.dart';
import 'get_all_task_controller.dart';

class DeleteTaskController extends GetxController {

  final StorageService _storageService = StorageService();

  /// kon task delete hocche seta track kori, card e loader dekhanor jonno
  var deletingIds = <String>{}.obs;

  /// id = task er TId
  Future<void> deleteTask(String id) async {
    try {
      deletingIds.add(id);

      String token = _storageService.read<String>('access_token') ?? '';

      var response = await http.delete(
        Uri.parse("${ApiUrl.tasks}/$id"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print("delete task ========== ${response.statusCode} ${response.body}");

      bool success = response.statusCode >= 200 && response.statusCode < 300;
      String? message;
      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        success = responseBody['success'] == true;
        message = responseBody['message'];
      }

      if (success) {
        /// list theke remove kori, abar api call lagbe na
        Get.find<GetAllTaskController>().removeTask(id);
        CustomToast.showToast(message ?? "Task deleted");
      } else {
        CustomToast.showToast(message ?? 'Failed to delete task', isError: true);
      }
    } catch (error) {
      CustomToast.showToast(
        "Something went wrong. Please check your connection.",
        isError: true,
      );
      print("Delete task error: $error");
    } finally {
      deletingIds.remove(id);
    }
  }
}
