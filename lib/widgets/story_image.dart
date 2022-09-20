import 'package:flutter/material.dart';

Widget storiesImage() => Row(
      children: [
        Column(
          children: [
            Container(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(" Name")
          ],
        )
      ],
    );
