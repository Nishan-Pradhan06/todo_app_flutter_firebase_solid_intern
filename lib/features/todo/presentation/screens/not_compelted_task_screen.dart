import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class InCompletedTodos extends StatelessWidget {
  const InCompletedTodos({super.key});

  static const route = '/incompetedScreen';

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;
    final RemoteMessage? message =
        arguments is RemoteMessage ? arguments : null;
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Hello, incomplete task',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              if (message != null)
                Column(
                  children: [
                    Text(
                      message.notification?.title ?? "No Title",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      message.notification?.body ?? "No Body",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              else
                Text(
                  'No notification data available.',
                  style: TextStyle(fontSize: 20),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
