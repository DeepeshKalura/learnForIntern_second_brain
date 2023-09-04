import 'package:just_audio/just_audio.dart';

class MyAudioHandler {
  final _player = AudioPlayer();
  final _playlist = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
        Uri.parse(
            "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3"),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3"),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3"),
      ),
      AudioSource.asset("assets/devwohdev.mp3"),
    ],
  );
  get playlistLength => _playlist.length;
  AudioPlayer audioPlayer(int index) {
    _player.setAudioSource(_playlist[index]);
    _player.play();

    return _player;
  }

  Future<void> play() async {
    _player.setAudioSource(_playlist);
    await _player.play();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> next() async {
    await _player.seekToNext();
  }

  Future<void> previous() async {
    await _player.seekToPrevious();
  }

  Future<void> shuffle() async {
    await _player.shuffle();
  }

  Future<void> dispose() async {
    await _player.dispose();
  }

  //TODO: Need all the functionality from player_button.dart
}
