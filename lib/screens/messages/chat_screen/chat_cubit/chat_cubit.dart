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
        .collection('Messages')
        .doc(receverid)
        .set(chatModel.toMap())
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
        .collection('Messages')
        .doc(uId)
        .set(chatModel.toMap())
        .then((value) {
      print('Send Done');
      emit(SendMessageSuccessState());
    }).catchError((error) {
      print('Error In Send Message $error');
      emit(SendMessageErrorState());
    });
  }

  
}
