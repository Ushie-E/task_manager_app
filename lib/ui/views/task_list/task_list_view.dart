import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'task_list_viewmodel.dart';

class TaskListView extends StackedView<TaskListViewModel> {
  const TaskListView({super.key});

  @override
  Widget builder(
    BuildContext context,
    TaskListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: ListView.builder(
        itemCount: viewModel.tasks.length,
        itemBuilder: (context, index) {
          final task = viewModel.tasks[index];
          return Dismissible(
            key: Key(task.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) => viewModel.deleteTask(task.id),
            child: ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Checkbox(
                value: task.isCompleted,
                onChanged: (value) => viewModel.toggleTaskStatus(task),
              ),
              onTap: () => viewModel.navigateToTaskForm(task),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.navigateToTaskForm(null),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  TaskListViewModel viewModelBuilder(BuildContext context) =>
      TaskListViewModel();
}
