import 'package:chaty/constance/uId.dart';
import 'package:chaty/model/users_model.dart';
import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';

Widget sendMessageButton(
        {required ChatCubit cubit,
        required UserModel receverUserModel,
        required TextEditingController messageController}) =>
    Container(
      height: 50,
      width: 60,
      decoration: BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed: () {
          if (cubit.messageVideoFile != null) {
            cubit.uploadMessageVideo(
              text: messageController.text,
              receverId: receverUserModel.uId!,
              dateTime: DateTime.now().toString(),
            );
          } else if (cubit.messageImageFile != null) {
            cubit.uploadMessageImage(
              text: messageController.text,
              receverId: receverUserModel.uId!,
              dateTime: DateTime.now().toString(),
            );
          } else if (messageController.text != '') {
            cubit.sendMessage(
              senderId: uId,
              rec: '',
              image: '',
              video: '',
              text: messageController.text,
              receverId: receverUserModel.uId!,
              dateTime: DateTime.now().toString(),
            );
            messageController.clear();
          }
        },
        child: Icon(cubit.changeIconVoice(messageController:messageController ),color: Colors.white,),
        color: Colors.blue,
      ),
    );
