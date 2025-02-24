import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_manager_app/app/app.locator.dart';
import 'package:task_manager_app/app/app.router.dart';
import 'package:task_manager_app/services/notification_service.dart';
import 'package:task_manager_app/services/task_service.dart';
import 'package:task_manager_app/model/task.dart';

class TaskListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _taskService = locator<TaskService>();
  final _notificationService = locator<NotificationService>();

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> init() async {
    setBusy(true);
    _tasks = _taskService.getTasks();
    setBusy(false);
  }

  Future<void> addTask(Task task) async {
    _taskService.addTask(task);
    await _notificationService.scheduleNotification(task);
    await init();
  }

  Future<void> updateTask(Task task) async {
    _taskService.updateTask(task);
    await init();
  }

  Future<void> deleteTask(Task task) async {
    _taskService.deleteTask(task);
    await init();
  }

  void navigateToTaskForm({Task task}) {
    _navigationService.navigateToTaskFormsView(task: task);
  }
}
