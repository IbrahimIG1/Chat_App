abstract class ChatCubitState {}

class ChatInitState extends ChatCubitState {}

//  Send Message
class SendMessageSuccessState extends ChatInitState {}

class SendMessageErrorState extends ChatInitState {}
