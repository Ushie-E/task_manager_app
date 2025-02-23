import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'task_forms_viewmodel.dart';

class TaskFormsView extends StackedView<TaskFormsViewModel> {
  const TaskFormsView(@pathParam this.task, {super.key});

  final String task;

  @override
  Widget builder(
    BuildContext context,
    TaskFormsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: viewModel.titleController,
                decoration: const InputDecoration(labelText: "Title")),
            TextField(
                controller: viewModel.descriptionController,
                decoration: const InputDecoration(labelText: "Description")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => viewModel.saveTask(),
              child: const Text("Save Task"),
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
