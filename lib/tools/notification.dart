import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pokemon2/main.dart';

Future<void> showNotification() async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'your_channel_id',
    'your_channel_name',
    channelDescription: 'your_channel_description',
    importance: Importance.max,
    priority: Priority.high,
  );

  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: const DarwinNotificationDetails(badgeNumber: 2, presentBadge: true),
  );

  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    'Notification Title', // Title
    'Notification Body', // Body
    platformChannelSpecifics,

    payload: 'notification_payload',
  );
}
