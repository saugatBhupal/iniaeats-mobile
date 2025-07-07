import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RecipeVideo extends StatefulWidget {
  const RecipeVideo({super.key});

  @override
  State<RecipeVideo> createState() => _RecipeVideoState();
}

class _RecipeVideoState extends State<RecipeVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    const videoUrl = 'https://youtube.com/shorts/BXZzWg7IHms?si=9h_KeBquK_tmpM5M';

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false, controlsVisibleAtStart: true),
    );
  }

  void _seekBackward() {
    final current = _controller.value.position;
    final target = current - const Duration(seconds: 10);
    _controller.seekTo(target > Duration.zero ? target : Duration.zero);
  }

  void _seekForward() {
    final current = _controller.value.position;
    final duration = _controller.metadata.duration;
    final target = current + const Duration(seconds: 10);
    _controller.seekTo(target < duration ? target : duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.redAccent,
      progressColors: const ProgressBarColors(
        playedColor: AppColors.frog,
        handleColor: Colors.amberAccent,
      ),
      bottomActions: [
        IconButton(
          icon: const Icon(Icons.replay_10, color: Colors.white),
          onPressed: _seekBackward,
          tooltip: 'Rewind 10 seconds',
        ),
        CurrentPosition(),
        ProgressBar(isExpanded: true),
        IconButton(
          icon: const Icon(Icons.forward_10, color: Colors.white),
          onPressed: _seekForward,
          tooltip: 'Forward 10 seconds',
        ),
      ],
    );
  }
}
