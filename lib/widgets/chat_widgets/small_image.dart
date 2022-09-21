import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit.dart';
import 'package:chaty/shared/navigators/navigators.dart';
import 'package:flutter/material.dart';

Widget smallImage({required ChatCubit cubit})=>Container(
        width: 100,
        height: 120,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
           
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
              image: FileImage(cubit.messageImageFile!),
            ))),
            IconButton(
                onPressed: () {
                  cubit.closedMessageImage();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                )),
          ],
        ),
      );