import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../controller/audio_controller.dart';
import '../../util/app_colors.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    Key? key,
    required this.audioController,
  }) : super(key: key);

  final AudioController audioController;

  @override
  Widget build(BuildContext context) {
    final audioPlayer = audioController.audioPlayer;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed:
                  audioPlayer.hasPrevious ? audioPlayer.seekToPrevious : null,
              iconSize: 45,
              icon: const Icon(
                Icons.skip_previous,
                color: AppColors.secondWhiteColor,
              ),
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
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
              } else if (!audioPlayer.playing) {
                return IconButton(
                  onPressed: audioPlayer.play,
                  iconSize: 75,
                  icon: const Icon(
                    Icons.play_circle,
                    color: AppColors.secondWhiteColor,
                  ),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: const Icon(
                    Icons.pause_circle,
                    color: AppColors.secondWhiteColor,
                  ),
                  iconSize: 75.0,
                  onPressed: audioPlayer.pause,
                );
              } else {
                return IconButton(
                  icon: const Icon(
                    Icons.replay_circle_filled_outlined,
                    color: AppColors.secondWhiteColor,
                  ),
                  iconSize: 75.0,
                  onPressed: () => audioPlayer.seek(
                    Duration.zero,
                    index: audioPlayer.effectiveIndices!.first,
                  ),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: audioPlayer.hasNext ? audioPlayer.seekToNext : null,
              iconSize: 45,
              icon: const Icon(
                Icons.skip_next,
                color: AppColors.secondWhiteColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
