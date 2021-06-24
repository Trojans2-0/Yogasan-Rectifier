import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late FlutterLocalNotificationsPlugin plugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidInit = new AndroidInitializationSettings('app_icon');
    var iosInit = new IOSInitializationSettings();
    var initializationSettings =
        new InitializationSettings(android: androidInit, iOS: iosInit);
    plugin = new FlutterLocalNotificationsPlugin();
    plugin.initialize(initializationSettings,
        onSelectNotification: notificationSelected);
  }

  _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
      'Channel ID',
      'Yogasan Rectifier',
      'Reminder to stretch your muscles',
      importance: Importance.max,
    );
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);

    var scheduledTime = DateTime.now().add(
      Duration(seconds: 3),
    );

    print('Scheduled Time : $scheduledTime');

    plugin.schedule(1, 'Reminder', 'Time to stretch your muscles',
        scheduledTime, generalNotificationDetails);

    // await plugin.show(0, 'Reminder', 'Time to stretch your muscles',
    //     generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _showNotification,
          child: Text('Flutter Notifications'),
        ),
      ),
    );
  }

  Future notificationSelected(String? data) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Flutter Notification'),
      ),
    );
  }
}
