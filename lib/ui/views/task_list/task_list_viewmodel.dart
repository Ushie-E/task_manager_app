import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_manager_app/app/app.locator.dart';
import 'package:task_manager_app/app/app.router.dart';
import 'package:task_manager_app/model/task.dart';

class TaskListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  List<Task> tasks = [
    Task(
        id: '1',
        title: 'Buy groceries',
        description: 'Milk, Eggs, Bread',
        timestamp: DateTime.now()),
    Task(
        id: '2',
        title: 'Workout',
        description: 'Gym at 6 PM',
        timestamp: DateTime.now()),
  ];

  void toggleTaskStatus(Task task) {
    task.isCompleted = !task.isCompleted;
    rebuildUi();
  }

  Future<void> navigateToTaskForm(Task? task) async {
    final result = await _navigationService.navigateToTaskFormsView(task: task);

    if (result != null && result is Task) {
      if (task != null) {
        final index = tasks.indexWhere((t) => t.id == task.id);
        if (index != -1) {
          tasks[index] = result;
        }
      } else {
        tasks.add(result);
      }
      showSuccessMessage(task != null
          ? 'Task Updated Successfully!'
          : 'Task Added Successfully!');
      rebuildUi();
    }
  }

  void deleteTask(String taskId) {
    tasks.removeWhere((task) => task.id == taskId);
    showSuccessMessage('Task has been Delete');
    rebuildUi();
  }

  void showSuccessMessage(String message) {
    _snackbarService.showSnackbar(
      message: message,
      duration: const Duration(seconds: 2),
    );
  }
}
