import 'package:flutter/material.dart';

import '../../view/screen/home_screen.dart';
import '../../view/screen/no_screen.dart';
import '../../view/screen/playlist_screen.dart';
import '../../view/screen/song_screen.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RoutesName.songScreen:
        final Map arguments = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => SongScreen(
            song: arguments['song'],
          ),
        );
      case RoutesName.playlistScreen:
        return MaterialPageRoute(
          builder: (context) => const PlaylistScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NoScreen(),
        );
    }
  }
}
