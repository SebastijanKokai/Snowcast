import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';

void showNotificationPermissionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Enable Notifications'),
      content:
          const Text('We use notifications to alert you about important snow updates. Would you like to enable them?'),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('No thanks'),
        ),
        TextButton(
          onPressed: () {
            context.pop();
            _requestNotificationPermission();
          },
          child: const Text('Enable'),
        ),
      ],
    ),
  );
}

Future<void> _requestNotificationPermission() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
}
