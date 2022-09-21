import 'dart:io';

import 'package:chaty/constance/uId.dart';
import 'package:chaty/model/chat_model.dart';
import 'package:chaty/screens/messages/chat_screen/chat_cubit/chat_cubit_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit() : super(ChatInitState());
  static ChatCubit get(context) => BlocProvider.of(context);

  //  Send Message
  ChatModel? chatModel;

  void sendMessage({
    required String text,
    required String dateTime,
    required String senderId,
    required String receverId,
    required String image,
    required String video,
    required String rec,
  }) {
    ChatModel? chatModel = ChatModel(
        dateTime: dateTime,
        image: image,
        video: video,
        receverid: receverId,
        senderId: senderId,
        text: text,
        rec: rec);
    //  Save Message To Sender Id
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receverId)
        .collection('messages')
        .add(chatModel.toMap())
        .then((value) {
          nullingDone();
      print('Send Done');
      emit(SendMessageSuccessState());
    }).catchError((error) {
      print('Error In Send Message $error');
      emit(SendMessageErrorState());
    });
    //  Save Message To Recever Id
    FirebaseFirestore.instance
        .collection('users')
        .doc(receverId)
        .collection('chats')
        .doc(uId)
        .collection('messages')
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
        .collection('chats')
        .doc(receverId)
        .collection('messages')
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
 void nullingDone() {
    messageImageUrl = '';
    messageImageFile = null;
    messageVideoUrl = '';
    messageVideoFile = null;
  }
  //  pick Image
  var picker = ImagePicker();
  File? messageImageFile;
  String messageImageUrl = '';

  Future<void> pickImage() async {
    nullingDone();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile!.path != null) {
      messageImageFile = File(pickedFile.path);

      emit(PickImageSuccessState());
    } else {
      print('No Image Selected');
      emit(PickImageErrorState());
    }
  }

  //  Upload Image To Firebase
  String uploadMessageImage({
    required String text,
    required String receverId,
    required String dateTime,
    String? image,
    String? video,
  }) {
    emit(UploadImageLoadingState());
    FirebaseStorage.instance
        .ref()
        .child(
            'user/images/${Uri.file(messageImageFile!.path).pathSegments.last}')
        .putFile(messageImageFile!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        messageImageUrl = value;
        sendMessage(
            senderId: uId,
            text: text,
            receverId: receverId,
            dateTime: dateTime,
            image: value,
            video: '',
            rec: '');
        emit(UploadImageSuccessState());
        print('getDownloadURL Message Done in Upload Message image');
      }).catchError((error) {
        emit(UploadImageErrorState());
        print('Error In Upload Message Image in Then one $error');
      });
      // messageImageUrl = '';
      print('messageImageFile Null Done');
    }).catchError((error) {
      emit(UploadImageErrorState());
      print('Error In Upload Message Image in Then Tow $error');
    });
    return messageImageUrl;
  }

  // close Image After Pick
void closedMessageImage() {
    messageImageFile = null;
    messageImageUrl = '';
    emit(ClosedImageSuccess());
  }

  //  Pick Video Message
  File? messageVideoFile;
  String messageVideoUrl = '';
  Future<String> pickVideo() async {
    nullingDone();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (picker != null) {
      messageVideoFile = File(pickedFile!.path);
      emit(PickVideoSuccessState());
    } else {
      print('No Image Selected');
      emit(PickVideoErrorState());
    }
    return pickedFile!.path;
  }
   // close Video After Pick
void closedMessageVideo() {
    messageVideoFile = null;
    messageVideoUrl = '';
    emit(ClosedImageSuccess());
  }

  // Upload Video Message To Firebase
  void uploadMessageVideo({
    required String text,
    required String receverId,
    required String dateTime,
    String? image,
    String? video,
  }) {
    emit(UploadVideoLoadingState());
    FirebaseStorage.instance
        .ref()
        .child(
            'user/videos/${Uri.file(messageVideoFile!.path).pathSegments.last}')
        .putFile(messageVideoFile!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // messageVideoUrl = value;
        sendMessage(
            senderId: uId,
            text: text,
            receverId: receverId,
            dateTime: dateTime,
            image: '',
            video: value,
            rec: '');

        emit(UploadVideoSuccessState());
        print('getDownloadURL Message Done in Upload Message image');
      }).catchError((error) {
        emit(UploadVideoErrorState());
        print('Error In Upload Message Image in Then one');
      });
      // messageImageUrl = '';
      print('messageImageFile Null Done');
    }).catchError((error) {
      emit(UploadVideoErrorState());
      print('Error In Upload Message Image in Then Tow');
    });
  }

  // Change recorde Icon
  
  IconData voiceIcon = Icons.keyboard_voice_rounded;
  IconData changeIconVoice({recorder, stop, recored,messageController}) {
    if (messageController.text != '' ||
        messageVideoFile != null ||
        messageImageFile != null) {
      voiceIcon = Icons.send_sharp;
      emit(ChangeIconVoiceSuccessState());
    } else {
      voiceIcon = Icons.keyboard_voice_rounded;
      emit(ChangeIconVoiceErrorState());
    }
    return voiceIcon;
  }
}
