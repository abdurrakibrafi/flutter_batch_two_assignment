// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/api_urls.dart';
import '../../../constant/local_storage.dart';
import '../../../utils/custom_toast_message.dart';
import '../model/task_model.dart';

class TaskController extends GetxController {
  final StorageService _storageService = StorageService();

  static const int _limit = 20;

  var tasks = <TaskModel>[].obs;
  var totalRecords = 0.obs;

  var isLoading = false.obs; // first page
  var isLoadingMore = false.obs; // next pages
  var isCreating = false.obs;

  int _currentPage = 1;
  var hasNext = false.obs;

  /// kon task delete hocche seta track kori, card e loader dekhanor jonno
  var deletingIds = <String>{}.obs;

  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer ${_storageService.read<String>('access_token') ?? ''}',
  };

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
      var response = await http.get(
        Uri.parse("${ApiUrl.tasks}?page=$page&limit=$_limit"),
        headers: _headers,
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
        CustomToast.showToast(
          responseBody['message'] ?? 'Failed to load tasks',
          isError: true,
        );
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

  /// success hole true return kore, jate view form clear korte pare
  Future<bool> createTask({
    required String title,
    required String content,
    required TaskStatus status,
  }) async {
    try {
      isCreating(true);

      var body = {
        "title": title,
        "content": content,
        "status": status.apiValue,
      };
      print("create task body ========== $body");

      var response = await http.post(
        Uri.parse(ApiUrl.tasks),
        headers: _headers,
        body: jsonEncode(body),
      );
      var responseBody = jsonDecode(response.body);
      print("create task ========== ${response.statusCode} ${response.body}");

      if (responseBody['success'] == true) {
        CustomToast.showToast(
          responseBody['message'] ?? "Task created successfully",
        );
        await fetchTasks();
        return true;
      } else {
        CustomToast.showToast(
          responseBody['message'] ?? 'Failed to create task',
          isError: true,
        );
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
      isCreating(false);
    }
  }

  /// id = task er TId
  Future<void> deleteTask(String id) async {
    try {
      deletingIds.add(id);

      var response = await http.delete(
        Uri.parse("${ApiUrl.tasks}/$id"),
        headers: _headers,
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
        tasks.removeWhere((task) => task.id == id);
        if (totalRecords.value > 0) totalRecords.value--;
        CustomToast.showToast(message ?? "Task deleted");
      } else {
        CustomToast.showToast(
          message ?? 'Failed to delete task',
          isError: true,
        );
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
