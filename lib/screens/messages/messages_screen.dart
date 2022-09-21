import 'package:chaty/home/app_cubit/app_cubit.dart';
import 'package:chaty/home/app_cubit/app_cubit_state.dart';
import 'package:chaty/screens/messages/chat_screen/chat_screen.dart';
import 'package:chaty/shared/navigators/navigators.dart';
import 'package:chaty/widgets/messages_items/message_item.dart';
import 'package:chaty/widgets/story_item/story_image_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getUserData()
        ..getUsersData(),
      child: BlocConsumer<AppCubit, AppCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return ConditionalBuilder(
                condition: cubit.usersData.length > 0,
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
                builder: (context) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(children: [
                          Container(
                            height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  // Stories Image
                                  child: storiesImage(),
                                );
                              },
                              itemCount: 5,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 15,
                              ),
                            ),
                          ),
                          //  Message Item
                          ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  NavigateTo(context, MessagePage(receverUserModel: cubit.usersData[index],));
                                },
                                child: messageItem(
                                    context: context,
                                    name: cubit.usersData[index].name!,
                                    image: cubit.usersData[index].image!,
                                    message: 'message',
                                    time: '9:00 AM'),
                              );
                            },
                            itemCount: cubit.usersData.length,
                            separatorBuilder: (context, index) => Divider(),
                          ),
                        ]),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
