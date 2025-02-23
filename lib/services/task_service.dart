import 'package:hive/hive.dart';

import '../model/task.dart';

class TaskService {
  final Box<Task> _taskBox = Hive.box<Task>('tasks');

  List<Task> getTasks() {
    return _taskBox.values.toList();
  }

  void addTask(Task task) {
    _taskBox.add(task);
  }

  void updateTask(Task task) {
    task.save();
  }

  void deleteTask(Task task) {
    task.delete();
  }
}
