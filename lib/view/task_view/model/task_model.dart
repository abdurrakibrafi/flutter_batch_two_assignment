import 'package:flutter/material.dart';

/// API status enum: pending | in_progress | completed | cancelled
enum TaskStatus {
  pending('pending', 'Pending', Color(0xFFF59E0B)),
  inProgress('in_progress', 'In Progress', Color(0xFF3B82F6)),
  completed('completed', 'Completed', Color(0xFF84C900)),
  cancelled('cancelled', 'Cancelled', Color(0xFFEF4444));

  final String apiValue;
  final String label;
  final Color color;

  const TaskStatus(this.apiValue, this.label, this.color);

  static TaskStatus fromApi(String? value) {
    return TaskStatus.values.firstWhere(
      (status) => status.apiValue == value,
      orElse: () => TaskStatus.pending,
    );
  }
}

class TaskModel {
  /// task er nijer id (TId) -- delete e eita lage
  final String id;

  /// je user er task tar uuid
  final String userUuid;
  final String title;
  final String content;
  final TaskStatus status;
  final DateTime? createdAt;

  TaskModel({
    required this.id,
    required this.userUuid,
    required this.title,
    required this.content,
    required this.status,
    this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: (json['TId'] ?? '').toString(),
      userUuid: (json['uuid'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      content: (json['content'] ?? '').toString(),
      status: TaskStatus.fromApi(json['status']?.toString()),
      createdAt: DateTime.tryParse((json['create_at'] ?? '').toString()),
    );
  }
}
