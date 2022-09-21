import 'package:chaty/constance/uId.dart';

import 'package:chaty/model/users_model.dart';
import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit.dart';
import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit_state.dart';
import 'package:chaty/widgets/chat_widgets/message_feild.dart';
import 'package:chaty/widgets/chat_widgets/send_message_button.dart';
import 'package:chaty/widgets/chat_widgets/small_image.dart';
import 'package:chaty/widgets/chat_widgets/small_video.dart';
import 'package:chaty/widgets/chat_widgets/the_message__chat_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key, required this.receverUserModel});
  final UserModel receverUserModel;
  @override
  Widget build(BuildContext context) {
    var messageController = TextEditingController();
    return BlocProvider(
        create: (context) =>
            ChatCubit()..getMessage(receverId: receverUserModel.uId!),
        child: BlocConsumer<ChatCubit, ChatCubitState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = ChatCubit.get(context);
              return Scaffold(
                  appBar: AppBar(
                    title: Text(receverUserModel.name!),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  if (cubit.messages[index].senderId == uId) {
                                    return message(
                                        chatModel: cubit.messages[index],
                                        image: cubit.messages[index].image!,
                                        rec: cubit.messages[index].rec!,
                                        video: cubit.messages[index].video!,
                                        txt: cubit.messages[index].text!,
                                        color: Colors.blueAccent,
                                        topRight: 20,
                                        topLeft: 0,
                                        align: Alignment.topLeft);
                                  } else {
                                    return message(
                                        chatModel: cubit.messages[index],
                                        image: cubit.messages[index].image!,
                                        rec: cubit.messages[index].rec!,
                                        video: cubit.messages[index].video!,
                                        txt: cubit.messages[index].text!,
                                        color: Colors.grey,
                                        topRight: 0,
                                        topLeft: 20,
                                        align: Alignment.topRight);
                                  }
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 15,
                                    ),
                                itemCount: cubit.messages.length),
                          ),
                          if (cubit.messageImageFile != null)
                            smallImage(cubit: cubit),
                             if (cubit.messageVideoFile != null)
                            // smallVideo(cubit: cubit,context: context),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            child: Row(children: [
                              Expanded(
                                child: writeMessageFeild(
                                  context:context ,
                                    messageController: messageController,
                                    chatCubit: cubit),
                              ),
                              sendMessageButton(
                                receverUserModel: receverUserModel,
                                cubit: cubit,
                                messageController: messageController,
                              )
                            ]),
                          )
                        ]),
                  ));
            }));
  }
}
