import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationController {
  static initial() async {
    AwesomeNotifications().initialize(
      null, // ! Add App Image
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'high_importance_channel_group',
          channelGroupName: 'Group 1',
        )
      ],
      debug: true,
    );

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  static showMediaPlayerNotification() async {
    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) async {
        if (!isAllowed) {
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        actionType: ActionType.KeepOnTop,

        id: 122,
        channelKey: "basic_channel",
        notificationLayout: NotificationLayout.BigPicture,
        bigPicture: 'asset://assets/images/pray.jpg',

        summary: 'Artist Name',

        title: 'Media Player',
        body: 'Media Player is running in the background',
        // Set the media controls style

        category: NotificationCategory.Service,
        fullScreenIntent: true,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'play',
          label: 'Play',
          autoDismissible: false,
          actionType: ActionType.KeepOnTop,
        ),
        NotificationActionButton(
          key: 'pause',
          label: 'Pause',
          autoDismissible: false,
          actionType: ActionType.KeepOnTop,
        ),
        NotificationActionButton(
          key: 'next',
          label: 'Next',
          autoDismissible: false,
          actionType: ActionType.KeepOnTop,
        ),
      ],
    );
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }
}
