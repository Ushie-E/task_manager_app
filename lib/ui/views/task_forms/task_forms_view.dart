import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_manager_app/model/task.dart';
import 'package:task_manager_app/ui/views/task_forms/task_forms_viewmodel.dart';

class TaskFormsView extends StackedView<TaskFormsViewModel> {
  const TaskFormsView({
    this.task,
    super.key,
  });

  final Task? task;

  @override
  Widget builder(
    BuildContext context,
    TaskFormsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task == null ? 'New Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: viewModel.titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: viewModel.descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.saveTask,
              child: const Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  TaskFormsViewModel viewModelBuilder(BuildContext context) =>
      TaskFormsViewModel(task);
}
