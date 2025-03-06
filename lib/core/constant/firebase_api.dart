import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:todo/main.dart';
import '../../features/todo/presentation/screens/not_compelted_task_screen.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log('Title: ${message.notification?.title}');
  log('Body: ${message.notification?.body}');
  log('Data: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      InCompletedTodos.route,
      arguments: message,
    );
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> initNotifications() async {
    // Register the background message handler
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotifications();

    // Request permissions
    await _firebaseMessaging.requestPermission();

    // Get the FCM token
    final fCMToken = await _firebaseMessaging.getToken();
    log('Token: $fCMToken');
  }
}
