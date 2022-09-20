import 'package:chaty/constance/uId.dart';
import 'package:chaty/model/users_model/users_model.dart';
import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit.dart';
import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    var messageController = TextEditingController();
    return BlocProvider(
        create: (context) => ChatCubit(),
        child: BlocConsumer<ChatCubit, ChatCubitState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = ChatCubit.get(context);
              return Scaffold(
                  appBar: AppBar(
                    title: Text(userModel.name!),
                    actions: [
                      Icon(Icons.call),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.video_call),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.more_vert),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Spacer(),
                        Container(
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: messageController,
                                  decoration: InputDecoration(
                                      hintText: 'Write Message...',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 60,
                                child: MaterialButton(
                                  onPressed: () {
                                    cubit.sendMessage(
                                      text: messageController.text,
                                      dateTime: DateTime.now().toString(),
                                      senderId: uId,
                                      receverid: userModel.uId!,
                                      image: '',
                                      voice: '',
                                    );
                                  },
                                  child: Icon(
                                    Icons.send_sharp,
                                    color: Colors.white,
                                  ),
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
            }));
  }
}
