import 'package:hive/hive.dart';

import '../model/task.dart';

class TaskService {
  static const String _taskBoxName = 'tasks';

  Future<void> init() async {
    await Hive.openBox<Task>(_taskBoxName);
  }

  List<Task> getTasks() {
    final box = Hive.box<Task>(_taskBoxName);
    return box.values.toList();
  }

  Future<void> addTask(Task task) async {
    final box = Hive.box<Task>(_taskBoxName);
    await box.put(task.id, task);
  }

  Future<void> updateTask(Task task) async {
    final box = Hive.box<Task>(_taskBoxName);
    await box.put(task.id, task);
  }

  Future<void> deleteTask(String taskId) async {
    final box = Hive.box<Task>(_taskBoxName);
    await box.delete(taskId);
  }

  Future<void> toggleTaskCompletion(String taskId) async {
    final box = Hive.box<Task>(_taskBoxName);
    final task = box.get(taskId);
    if (task != null) {
      task.isCompleted = !task.isCompleted;
      await task.save();
    }
  }
}
