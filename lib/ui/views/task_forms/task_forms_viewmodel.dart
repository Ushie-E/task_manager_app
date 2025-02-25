import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_manager_app/model/task.dart';
import 'package:uuid/uuid.dart';
import 'package:task_manager_app/app/app.locator.dart';

class TaskFormsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final Task? task;

  late TextEditingController titleController;
  late TextEditingController descriptionController;

  TaskFormsViewModel(this.task) {
    titleController = TextEditingController(text: task?.title ?? '');
    descriptionController =
        TextEditingController(text: task?.description ?? '');
  }

  void saveTask() {
    final newTask = Task(
      id: task?.id ?? const Uuid().v4(),
      title: titleController.text,
      description: descriptionController.text,
      timestamp: DateTime.now(),
      isCompleted: task?.isCompleted ?? false,
    );

    _navigationService.back(result: newTask);
  }
}
