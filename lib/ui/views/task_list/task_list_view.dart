import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'task_list_viewmodel.dart';

class TaskListView extends StackedView<TaskListViewModel> {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, TaskListViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager"),
      ),
      body: ListView.builder(
        itemCount: viewModel.tasks.length,
        itemBuilder: (context, index) {
          final task = viewModel.tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => viewModel.deleteTask(task),
            ),
            onTap: () => viewModel.navigateToTaskForm(task),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.navigateToTaskForm(),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  TaskListViewModel viewModelBuilder(BuildContext context) =>
      TaskListViewModel();
}
