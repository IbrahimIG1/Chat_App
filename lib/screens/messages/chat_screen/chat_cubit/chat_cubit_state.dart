abstract class ChatCubitState {}

class ChatInitState extends ChatCubitState {}

//  Send Message
class SendMessageSuccessState extends ChatInitState {}

class SendMessageErrorState extends ChatInitState {}

//  Get Messages
class GetMessageSuccessState extends ChatInitState {}

class GetMessagesErrorState extends ChatInitState {}

