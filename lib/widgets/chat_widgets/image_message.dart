import 'package:chaty/model/chat_model.dart';
import 'package:chaty/widgets/chat_widgets/time_message.dart';
import 'package:flutter/material.dart';

Widget messageImage(
   {required ChatModel chatModel,
  required String txt,
  required String image,
  required String video,
  required String rec,
  required Color color,
  required double topRight,
  required double topLeft,
  required Alignment align,}
)=>Align(
            alignment: align,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          txt,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        MessageTime(txt: txt, model: chatModel),
                        Icon(
                          Icons.done_all,
                          size: 20,
                          color: Colors.white60,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );