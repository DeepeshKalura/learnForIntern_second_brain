import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../view/widget/seek_bar.dart';

class AudioController extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayer get audioPlayer => _audioPlayer;

  Future<void> play(String link) async {
    if (_audioPlayer.playing) {
      await _audioPlayer.stop();
    }
    await _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///$link'),
          ),
        ],
      ),
    );
    await _audioPlayer.play();

    notifyListeners();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    notifyListeners();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    notifyListeners();
  }

  Future<void> seek() async {
    await audioPlayer.seek(
      Duration.zero,
      index: audioPlayer.effectiveIndices!.first,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
        _audioPlayer.positionStream,
        _audioPlayer.durationStream,
        (
          Duration position,
          Duration? duration,
        ) {
          return SeekBarData(
            position,
            duration ?? Duration.zero,
          );
        },
      );
}
