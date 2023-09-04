import 'package:flutter/material.dart';

import 'controller/notification_controller.dart';
import 'screen/song_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initializeNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SongScreen(),
    );
  }
}
