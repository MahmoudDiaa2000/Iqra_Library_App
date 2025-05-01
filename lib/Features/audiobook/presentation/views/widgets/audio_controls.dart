import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioControls extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final VoidCallback onTogglePlayPause;
  final bool isPlaying;

  const AudioControls({
    super.key,
    required this.audioPlayer,
    required this.onTogglePlayPause,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
            size: 64,
          ),
          onPressed: onTogglePlayPause,
        ),
      ],
    );
  }
}
