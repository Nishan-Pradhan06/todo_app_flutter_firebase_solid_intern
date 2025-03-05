// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;

// class NotificationService {
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // Initialize the notification service
//   Future<void> initialize() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//     tz.initializeTimeZones(); // Initialize time zones
//   }

//   // Schedule a notification
//   Future<void> scheduleNotification({
//     required String id,
//     required String title,
//     required String body,
//     required DateTime scheduledTime,
//   }) async {
//     final tz.TZDateTime tzScheduledTime = tz.TZDateTime.from(
//       scheduledTime,
//       tz.local,
//     );

//     await _flutterLocalNotificationsPlugin.zonedSchedule(
//       id.hashCode, // Unique ID for the notification
//       title,
//       body,
//       tzScheduledTime
//           .subtract(const Duration(minutes: 10)), // Notify 10 minutes before
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'todo_channel', // Channel ID
//           'Todo Notifications', // Channel name
//           importance: Importance.high,
//           priority: Priority.high,
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.alarmClock,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }

//   // Cancel a notification
//   Future<void> cancelNotification(int id) async {
//     await _flutterLocalNotificationsPlugin.cancel(id.hashCode);
//   }
// }
