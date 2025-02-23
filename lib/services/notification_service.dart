import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../model/task.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings =
        InitializationSettings(android: androidSettings);

    await _flutterLocalNotificationsPlugin.initialize(settings);
  }

  Future<void> scheduleNotification(Task task) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'task_channel',
      'Task Reminders',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    final DateTime scheduledTime =
        task.timestamp.add(const Duration(minutes: 5));

    if (scheduledTime.isAfter(DateTime.now())) {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        task.hashCode,
        'Task Reminder',
        task.title,
        tz.TZDateTime.from(scheduledTime, tz.local),
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }
}
