import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:backgroundaudioplayer/controller/notification_controller.dart';
import 'package:backgroundaudioplayer/screen/player.dart';
import 'package:flutter/material.dart';

import '../service/audio_handler.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final MyAudioHandler _audioHandler = MyAudioHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Song Screen"),
      ),
      body: ListView.builder(
        itemCount: _audioHandler.playlistLength,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Song ${index + 1}'),
            subtitle: Text('Artist ${index + 1}'),
            onTap: () {
              NotificationService.showNotification(
                body: "This is song playing in notification",
                title: "Song ${index + 1}",
                bigPicture:
                    "https://images.unsplash.com/photo-1642774667024-e9e2f37914d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1907&q=80",
                notificationLayout: NotificationLayout.BigPicture,
                actionButtons: [
                  NotificationActionButton(
                      key: "PLAY",
                      actionType: ActionType.KeepOnTop,
                      enabled: true,
                      label: "teray"
                      // autoCancel: true,
                      ),
                  NotificationActionButton(
                    key: "PAUSE",
                    label: "terause",
                    actionType: ActionType.KeepOnTop,
                    enabled: true,
                    // autoCancel: true,
                  ),
                  NotificationActionButton(
                    key: "STOP",
                    label: "terop",
                    actionType: ActionType.KeepOnTop,
                    enabled: true,
                    // autoCancel: true,
                  ),
                ],
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Player(
                      audioPlayer: _audioHandler.audioPlayer(index),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
