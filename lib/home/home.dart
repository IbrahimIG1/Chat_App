import 'package:chaty/model/users_model.dart';
import 'package:chaty/screens/group/group_screen.dart';
import 'package:chaty/screens/messages/messages_screen.dart';
import 'package:chaty/screens/online/online_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key,});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat App'),
          centerTitle: true,
          actions: [Icon(Icons.search)],
          leading: Icon(Icons.menu),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Message',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'Online',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'Group',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
            children: [MessagesScreen(), OnllineScreen(), GroupScreen()]),
      ),
    );
  }
}
