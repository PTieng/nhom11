import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class LocalNotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initializeNotification() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("appicon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
         onSelectNotification: selectNotification
        );
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
    ));
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    return flutterLocalNotificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
    Get.to(() => Container(
          color: Colors.amber,
        ));
  }
}
