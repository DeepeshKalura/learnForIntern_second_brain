import 'package:flutter/foundation.dart';

class PlayButtonController extends ValueNotifier<ButtonState> {
  PlayButtonController() : super(_initialValue);
  static const _initialValue = ButtonState.paused;
}

enum ButtonState {
  paused,
  playing,
  loading,
}
