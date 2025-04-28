import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerView extends StatefulWidget {
  final List<AudioBookModel> audioBooks;
  final int initialIndex;

  const AudioPlayerView({
    super.key,
    required this.audioBooks,
    this.initialIndex = 0,
  });

  @override
  State<AudioPlayerView> createState() => _AudioPlayerViewState();
}

class _AudioPlayerViewState extends State<AudioPlayerView> {
  late AudioPlayer _audioPlayer;
  late int _currentIndex;
  bool isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _audioPlayer = AudioPlayer();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    await _setAudio();
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _position = position;
      });
    });

    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _duration = duration ?? Duration.zero;
      });
    });

    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  Future<void> _setAudio() async {
    await _audioPlayer.setUrl(widget.audioBooks[_currentIndex].audioUrl);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _rewind5Seconds() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition - const Duration(seconds: 5);
    _audioPlayer.seek(
      newPosition > Duration.zero ? newPosition : Duration.zero,
    );
  }

  void _forward5Seconds() {
    final currentPosition = _audioPlayer.position;
    final duration = _audioPlayer.duration;

    if (duration != null) {
      final newPosition = currentPosition + const Duration(seconds: 5);
      _audioPlayer.seek(newPosition < duration ? newPosition : duration);
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final currentBook = widget.audioBooks[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Now Playing',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                currentBook.imagePath,
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              currentBook.title,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              currentBook.author,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // 🎚️ Progress Bar
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white38,
                thumbColor: Colors.amber,
              ),
              child: Slider(
                min: 0,
                max: _duration.inSeconds.toDouble(),
                value: _position.inSeconds.toDouble().clamp(
                  0,
                  _duration.inSeconds.toDouble(),
                ),
                onChanged: (value) {
                  _audioPlayer.seek(Duration(seconds: value.toInt()));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(_position),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  _formatDuration(_duration),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),

            // const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _rewind5Seconds,
                  icon: Icon(
                    Icons.replay_5,
                    size: 48,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                IconButton(
                  onPressed: _togglePlayPause,
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    size: 64,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                IconButton(
                  onPressed: _forward5Seconds,
                  icon: Icon(
                    Icons.forward_5,
                    size: 48,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AudioBookModel {
  final String title;
  final String author;
  final String audioUrl;
  final String imagePath;

  AudioBookModel({
    required this.title,
    required this.author,
    required this.audioUrl,
    required this.imagePath,
  });
}
