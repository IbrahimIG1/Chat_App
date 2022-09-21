
import 'package:cached_video_player/cached_video_player.dart';
import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit.dart';
import 'package:chaty/widgets/chat_widgets/video_player/icon_pause.dart';
import 'package:chaty/widgets/chat_widgets/video_player/indicator.dart';
import 'package:chaty/widgets/chat_widgets/video_player/volume.dart';
import 'package:flutter/material.dart';

class VideoMessage extends StatefulWidget {
  const VideoMessage({super.key, required this.cubit});
  final ChatCubit cubit;

  @override
  State<VideoMessage> createState() => _VideoMessageState();
}

class _VideoMessageState extends State<VideoMessage> {
  @override
  CachedVideoPlayerController? videoController;
  
  //  initialized The Video Player
  void initState() {

    super.initState();

    videoController = CachedVideoPlayerController.asset(Uri.file(widget.cubit.messageVideoFile!.path).pathSegments.last)
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () 
        {
          widget.cubit.closedMessageVideo();
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body:  Column(
        children: [
          GestureDetector(
            
            behavior: HitTestBehavior.opaque,
            onTap: () {
              videoController!.value.isPlaying
                  ? videoController!.pause()
                  : videoController!.play();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                videoController != null &&
                        videoController!.value.isInitialized
                    ? CachedVideoPlayer(videoController!)
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
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
        ],
      ),
    );
  }
}
