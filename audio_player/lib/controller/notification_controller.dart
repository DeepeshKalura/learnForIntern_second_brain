import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationController {
  static initial() {
    AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      // 'resource://drawable/res_app_icon',
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
        )
      ],
    );
  }
}
