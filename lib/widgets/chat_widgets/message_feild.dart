import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit.dart';
import 'package:chaty/screens/messages/chat_screen/video_message/video_message.dart';
import 'package:chaty/shared/navigators/navigators.dart';
import 'package:flutter/material.dart';

Widget writeMessageFeild(
        {required TextEditingController messageController,
        required ChatCubit chatCubit,
        required context}) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 1)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Write Message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                chatCubit.pickImage();
              },
              icon: Icon(Icons.image_outlined)),
          IconButton(
              onPressed: () {
                chatCubit.pickVideo().then((value) {
                  print("path : ${Uri.file(chatCubit.messageVideoFile!.path).pathSegments.last}");
                  // print("${chatCubit.messageVideoFile!.path}");
                //  if(chatCubit.messageVideoFile != null) {
                //    NavigateTo(context, VideoMessage(cubit: chatCubit));
                //  }
                });
              },
              icon: Icon(Icons.videocam_sharp)),
        ],
      ),
    );
