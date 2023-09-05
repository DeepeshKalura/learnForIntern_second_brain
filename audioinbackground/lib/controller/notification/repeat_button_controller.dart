import 'package:flutter/foundation.dart';

class RepeatButtonController extends ValueNotifier<RepeatState> {
  RepeatButtonController() : super(_initialValue);
  static const _initialValue = RepeatState.off;

  void nextState() {
    final next = (value.index + 1) % RepeatState.values.length;
    value = RepeatState.values[next];
  }
}

enum RepeatState {
  off,
  repeatSong,
  repeatPlaylist,
}
