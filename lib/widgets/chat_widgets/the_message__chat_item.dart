import 'package:chaty/model/chat_model.dart';
import 'package:chaty/widgets/chat_widgets/image_message.dart';
import 'package:chaty/widgets/chat_widgets/time_message.dart';
import 'package:flutter/material.dart';

Widget message({
  required ChatModel chatModel,
  required String txt,
  required String image,
  required String video,
  required String rec,
  required Color color,
  required double topRight,
  required double topLeft,
  required Alignment align,
}) =>
    Column(
      children: [
        if (txt != '')
          Align(
            alignment: align,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Container(
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(topRight),
                      topLeft: Radius.circular(topLeft),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Text(
                    textAlign: TextAlign.right,
                    txt,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        if (image != '' && image != null)
          messageImage(
              chatModel: chatModel,
              txt: txt,
              image: image,
              video: video,
              rec: rec,
              color: color,
              topRight: topRight,
              topLeft: topLeft,
              align: align),

        // if (video != '' && video != null)
        //   VideoMessage(align: align, cubit: cubit, url: video,model: message),
        // if (rec != '' && rec != null)
        //   RecMessage(align: align,model: message),
      ],
    );
