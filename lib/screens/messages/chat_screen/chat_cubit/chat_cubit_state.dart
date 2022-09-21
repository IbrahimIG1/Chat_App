abstract class ChatCubitState {}

class ChatInitState extends ChatCubitState {}

//  Send Message
class SendMessageSuccessState extends ChatInitState {}

class SendMessageErrorState extends ChatInitState {}

//  Get Messages
class GetMessageSuccessState extends ChatInitState {}

class GetMessagesErrorState extends ChatInitState {}

//  Pick Image
class PickImageSuccessState extends ChatInitState {}

class PickImageErrorState extends ChatInitState {}

// Upload Image TO Firebase

class UploadImageLoadingState extends ChatInitState {}

class UploadImageSuccessState extends ChatInitState {}

class UploadImageErrorState extends ChatInitState {}
class ClosedImageSuccess extends ChatInitState {}


//  Pick Video
class PickVideoSuccessState extends ChatInitState {}

class PickVideoErrorState extends ChatInitState {}
class ClosedVideoSuccess extends ChatInitState {}


// Upload Video TO Firebase

class UploadVideoLoadingState extends ChatInitState {}

class UploadVideoSuccessState extends ChatInitState {}

class UploadVideoErrorState extends ChatInitState {}

// Change Recorde Icon
class ChangeIconVoiceSuccessState extends ChatInitState {}

class ChangeIconVoiceErrorState extends ChatInitState {}


