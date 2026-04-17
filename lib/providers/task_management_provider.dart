import 'package:flutter/material.dart';
import 'package:flutter_ui_class/models/task_model.dart';
import 'package:flutter_ui_class/repository/task_repository.dart';

class TaskManagementProvider with ChangeNotifier {
  final TaskRepository _repo = TaskRepository();

  Stream<List<TaskModel>> get tasksStream => _repo.getTasks();

  Future<void> addTask(String title, String description) async {
    final task = TaskModel(
      id: '',
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );

    await _repo.addTask(task);
  }

  Future<void> deleteTask(String id) async {
    await _repo.deleteTask(id);
  }
}
