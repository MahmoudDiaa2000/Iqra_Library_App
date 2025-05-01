import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:iqra_library_app/Features/audiobook/data/models/podcast_model.dart';

class AudioPlayerView extends StatefulWidget {
  final PodcastModel audio;

  const AudioPlayerView({super.key, required this.audio});

  @override
  State<AudioPlayerView> createState() => _AudioPlayerViewState();
}

class _AudioPlayerViewState extends State<AudioPlayerView> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    try {
      await _audioPlayer.stop();

      if (widget.audio.audio.isEmpty) {
        throw Exception('Audio URL is empty');
      }

      await _audioPlayer.setUrl(widget.audio.audio);

      await _audioPlayer.load();
    } catch (e) {
      debugPrint('Error loading audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.audio.title))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.audio.image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.audio.title,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.audio.publisher,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
            const Spacer(),

            // Slider
            StreamBuilder<Duration>(
              stream: _audioPlayer.positionStream,
              builder: (context, snapshot) {
                final position = snapshot.data ?? Duration.zero;
                final total = _audioPlayer.duration ?? Duration.zero;
                return Column(
                  children: [
                    Slider(
                      value: position.inSeconds.toDouble(),
                      max: total.inSeconds.toDouble(),
                      onChanged: (value) {
                        _audioPlayer.seek(Duration(seconds: value.toInt()));
                      },
                    ),
                    Text(
                      "${_formatTime(position)} / ${_formatTime(total)}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                );
              },
            ),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10),
                  iconSize: 36,
                  onPressed: () {
                    final newPosition = _audioPlayer.position -
                        const Duration(seconds: 10);
                    _audioPlayer.seek(
                        newPosition > Duration.zero ? newPosition : Duration
                            .zero);
                  },
                ),
                StreamBuilder<PlayerState>(
                  stream: _audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    final isPlaying = snapshot.data?.playing ?? false;
                    return IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause_circle_filled : Icons
                            .play_circle_fill,
                      ),
                      iconSize: 64,
                      onPressed: () {
                        isPlaying ? _audioPlayer.pause() : _audioPlayer.play();
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.forward_10),
                  iconSize: 36,
                  onPressed: () {
                    final max = _audioPlayer.duration ?? Duration.zero;
                    final newPosition = _audioPlayer.position +
                        const Duration(seconds: 10);
                    if (newPosition < max) {
                      _audioPlayer.seek(newPosition);
                    }
                  },
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
