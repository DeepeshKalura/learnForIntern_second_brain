import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';

import '../page_manager.dart';
import 'audio_controller.dart';
import 'playlist_controller.dart';

class AudioHandlerProvider extends ChangeNotifier {
  late AudioHandler _audioHandler;

  AudioHandler get audioHandler => _audioHandler;

  AudioHandlerProvider() {
    _initAudioService();
  }

  Future<void> _initAudioService() async {
    _audioHandler = await initAudioService();
    notifyListeners();
  }
}

class PlaylistRepositoryProvider extends ChangeNotifier {
  final PlaylistController _playlistController;

  PlaylistController get playlistRepository => _playlistController;

  PlaylistRepositoryProvider() : _playlistController = DemoPlaylist();
}

class PageManagerProvider extends ChangeNotifier {
  final PageManager _pageManager;

  PageManager get pageManager => _pageManager;

  PageManagerProvider() : _pageManager = PageManager();
}
