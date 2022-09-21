import 'package:cached_video_player/cached_video_player.dart';
import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit.dart';
import 'package:chaty/widgets/chat_widgets/video_player/icon_pause.dart';
import 'package:chaty/widgets/chat_widgets/video_player/indicator.dart';
import 'package:chaty/widgets/chat_widgets/video_player/volume.dart';
import 'package:flutter/material.dart';


class VideoPlayerWidget extends StatefulWidget {
  final AlignmentGeometry align;
  final ChatCubit cubit;
  final String url;
  VideoPlayerWidget(
      {Key? key, required this.align, required this.cubit, required this.url})
      : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  CachedVideoPlayerController? videoController;
  @override

  //  initialized The Video Player
  void initState() {

    super.initState();

    videoController = CachedVideoPlayerController.network(widget.url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)  // when video end start again
      ..initialize().then((value) => videoController!.pause()); // In first initialized it be paused no play mood
  }

  @override
  void dispose() {
    //  Stop Video When any issus happen
    videoController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.align,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          videoController!.value.isPlaying
              ? videoController!.pause()
              : videoController!.play();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
                aspectRatio: 8/10,
                child: videoController != null &&
                        videoController!.value.isInitialized
                    ? CachedVideoPlayer(videoController!)
                    : Center(
                        child: CircularProgressIndicator(),
                      )),
            Align(
                alignment: Alignment.center,
                child: videoController!.value.isPlaying
                    ? Container()
                    : PauseAndPlay()),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: videoController!.value.isPlaying
                  ? VideoIndicator(videoController: videoController!)
                  : Container(),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: VideoVolume(videoController: videoController!))
          ],
        ),
      ),
    );
  }
}
