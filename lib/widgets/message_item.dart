import 'package:flutter/material.dart';

Widget messageItem(
        {required String name,
        required String image,
        required String message,
        required String time,
        required BuildContext context}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage('$image'),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500]),
            ),
            Text(
              message,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500]),
            ),
          ],
        ),
        Spacer(),
        Text(
          time,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
