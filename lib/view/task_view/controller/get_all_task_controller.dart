// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api_urls.dart';
import '../../../constant/local_storage.dart';
import '../../../utils/custom_toast_message.dart';
import '../model/task_model.dart';

class GetAllTaskController extends GetxController {

  final StorageService _storageService = StorageService();

  static const int _limit = 20;

  var tasks = <TaskModel>[].obs;
  var totalRecords = 0.obs;

  var isLoading = false.obs; // first page
  var isLoadingMore = false.obs; // next pages

  int _currentPage = 1;
  var hasNext = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  /// refresh = true hole page 1 theke abar load kore
  Future<void> fetchTasks({bool refresh = true}) async {
    if (refresh) {
      if (isLoading.value) return;
      isLoading(true);
    } else {
      if (isLoadingMore.value || isLoading.value || !hasNext.value) return;
      isLoadingMore(true);
    }

    final page = refresh ? 1 : _currentPage + 1;

    try {
      String token = _storageService.read<String>('access_token') ?? '';

      var response = await http.get(
        Uri.parse("${ApiUrl.tasks}?page=$page&limit=$_limit"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      var responseBody = jsonDecode(response.body);
      print("get tasks ========== ${response.statusCode} ${response.body}");

      if (responseBody['success'] == true) {
        final data = responseBody['data'] ?? {};
        final pagination = data['pagination'] ?? {};

        final newTasks = ((data['tasks'] ?? []) as List)
            .whereType<Map<String, dynamic>>()
            .map(TaskModel.fromJson)
            .toList();

        if (refresh) {
          tasks.value = newTasks;
        } else {
          tasks.addAll(newTasks);
        }

        _currentPage = pagination['current_page'] ?? page;
        hasNext.value = pagination['has_next'] == true;
        totalRecords.value = pagination['total_records'] ?? tasks.length;
      } else {
        String errorMessage = responseBody['message'] ?? 'Failed to load tasks';
        CustomToast.showToast(errorMessage, isError: true);
      }
    } catch (error) {
      CustomToast.showToast(
        "Something went wrong. Please check your connection.",
        isError: true,
      );
      print("Fetch tasks error: $error");
    } finally {
      isLoading(false);
      isLoadingMore(false);
    }
  }

  Future<void> loadMore() => fetchTasks(refresh: false);

  /// delete hole list theke remove kori
  void removeTask(String id) {
    tasks.removeWhere((task) => task.id == id);
    if (totalRecords.value > 0) totalRecords.value--;
  }
}
