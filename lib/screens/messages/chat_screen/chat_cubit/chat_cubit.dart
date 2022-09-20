import 'package:chaty/constance/uId.dart';
import 'package:chaty/model/users_model/chat_model/chat_model.dart';
import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit() : super(ChatInitState());
  static ChatCubit get(context) => BlocProvider.of(context);

  //  Send Message
  ChatModel? chatModel;

  void sendMessage({
    required String text,
    required String dateTime,
    required String senderId,
    required String receverid,
    required String image,
    required String voice,
  }) {
    ChatModel? chatModel = ChatModel(
        dateTime: dateTime,
        image: image,
        receverid: receverid,
        senderId: senderId,
        text: text,
        voice: voice);
    //  Save Message To Sender Id
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receverid).collection('messages')
        .add(chatModel.toMap())
        .then((value) {
      print('Send Done');
      emit(SendMessageSuccessState());
    }).catchError((error) {
      print('Error In Send Message $error');
      emit(SendMessageErrorState());
    });
    //  Save Message To Recever Id
    FirebaseFirestore.instance
        .collection('users')
        .doc(receverid)
        .collection('chats')
        .doc(uId).collection('messages')
        .add(chatModel.toMap())
        .then((value) {
      print('Send Done');
      emit(SendMessageSuccessState());
    }).catchError((error) {
      print('Error In Send Message $error');
      emit(SendMessageErrorState());
    });
  }

  // Get Message
  List<ChatModel> messages = [];
  void getMessage({required String receverId}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats').doc(receverId).collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(
          ChatModel.fromJson(element.data()),
        );
      });
      print('Get Done');
      emit(GetMessageSuccessState());
    });
  }
}
