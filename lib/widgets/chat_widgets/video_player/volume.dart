import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

class VideoVolume extends StatelessWidget {
  final CachedVideoPlayerController videoController;
  const VideoVolume({Key? key, required this.videoController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isMuted = videoController.value.volume == 0;
    return IconButton(
      onPressed: () {
        videoController.setVolume(isMuted ? 1 : 0);
      },
      icon: isMuted
          ? const Icon(
              Icons.volume_off_outlined,
              color: Colors.red,
            )
          : const Icon(Icons.volume_up),
    );
  }
}
