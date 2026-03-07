import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {

  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
  tz.initializeTimeZones(); // initialize timezone database

  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings settings =
      InitializationSettings(android: androidSettings);

  await _notificationsPlugin.initialize(settings);
}

  static Future<void> showNotification(
    int id, String title, String body, DateTime scheduledDate) async {

  var androidDetails = const AndroidNotificationDetails(
    'task_channel',
    'Task Notifications',
    channelDescription: 'Reminders for tasks',
    importance: Importance.max,
    priority: Priority.high,
  );

  var platformDetails = NotificationDetails(android: androidDetails);

  // Convert DateTime to TZDateTime
  tz.TZDateTime tzScheduledDate = tz.TZDateTime.from(scheduledDate, tz.local);

  await _notificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tzScheduledDate,
    platformDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.dateAndTime,
  );
}

}