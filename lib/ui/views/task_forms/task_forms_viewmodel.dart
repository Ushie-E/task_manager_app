import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_manager_app/app/app.locator.dart';
import 'package:task_manager_app/services/task_service.dart';
import '../../../model/task.dart';

class TaskFormsViewModel extends BaseViewModel {
  final _taskService = locator<TaskService>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final Task? task;

  TaskFormsViewModel(this.task) {
    if (task != null) {
      titleController.text = task!.title;
      descriptionController.text = task!.description;
    }
  }

  void saveTask() {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      return;
    }

    if (task == null) {
      final newTask = Task(
        title: titleController.text,
        description: descriptionController.text,
        timestamp: DateTime.now(),
      );
      _taskService.addTask(newTask);
    } else {
      task!.title = titleController.text;
      task!.description = descriptionController.text;
      _taskService.updateTask(task!);
    }
  }
}
