import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'player_button.dart';

class Player extends StatefulWidget {
  const Player({
    super.key,
    required this.audioPlayer,
  });
  final AudioPlayer audioPlayer;

  @override
  PlayerState createState() => PlayerState();
}

class PlayerState extends State<Player> {
  var isLoading = true;

  @override
  void initState() {
    super.initState();

    // _audioPlayer
    //     .setAudioSource(ConcatenatingAudioSource(children: [
    //   AudioSource.uri(Uri.parse(
    //       "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3")),
    //   AudioSource.uri(Uri.parse(
    //       "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3")),
    //   AudioSource.uri(Uri.parse(
    //       "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3")),
    //   AudioSource.asset("assets/devwohdev.mp3"),
    // ]))
    //     .catchError((error) {
    //   // catch load errors: 404, invalid url ...
    //   print("An error occured $error");
    // });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: Center(
              child: PlayerButtons(widget.audioPlayer),
            ),
          );
  }
}
