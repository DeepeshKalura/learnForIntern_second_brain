import 'package:audio_player/controller/audio_controller.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioController = Provider.of<AudioController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: audioController.audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: audioController.audioPlayer.hasPrevious
                  ? audioController.audioPlayer.seekToPrevious
                  : null,
              iconSize: 45,
              icon: const Icon(
                Icons.skip_previous,
                color: Colors.white,
              ),
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: audioController.audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState = playerState!.processingState;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  width: 64.0,
                  height: 64.0,
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                );
              } else if (!audioController.audioPlayer.playing) {
                return IconButton(
                  onPressed: audioController.audioPlayer.play,
                  iconSize: 75,
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                  ),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: const Icon(
                    Icons.pause_circle,
                    color: Colors.white,
                  ),
                  iconSize: 75.0,
                  onPressed: () => audioController.pause(),
                );
              } else {
                return IconButton(
                  icon: const Icon(
                    Icons.replay_circle_filled_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 75.0,
                  onPressed: () => audioController.seek(),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioController.audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: audioController.audioPlayer.hasNext
                  ? audioController.audioPlayer.seekToNext
                  : null,
              iconSize: 45,
              icon: const Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}
