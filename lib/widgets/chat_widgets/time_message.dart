import 'package:chaty/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MessageTime extends StatelessWidget {
  final String txt;
  final ChatModel model;
  const MessageTime({Key? key, required this.txt, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.parse(model.dateTime!);
    var date = DateFormat.jm().format(dateTime);
    return Container(
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
            Text(date, style: Theme.of(context).textTheme.caption),
           
          ],
        ),
      );
  }
}