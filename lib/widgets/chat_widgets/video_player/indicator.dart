import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

class VideoIndicator extends StatelessWidget {
  final CachedVideoPlayerController videoController;

  const VideoIndicator({Key? key, required this.videoController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VideoProgressIndicator(
      videoController,
      allowScrubbing: true,
    );
  }
}
