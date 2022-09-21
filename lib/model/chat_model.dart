/*  this class For Chat Data In FireStore */
class ChatModel {
  String? text;
  String? dateTime;
  String? senderId;
  String? receverid;
  String? image;
  String? video;
  String? rec;
  

  ChatModel({
    this.text,
    this.dateTime,
    this.senderId,
    this.receverid,
    this.image,
    this.video,
    this.rec,
  });
  ChatModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    dateTime = json['dateTime'];
    video = json['video'];

    senderId = json['senderId'];
    receverid = json['receverid'];
    image = json['image'];
    rec = json['voice'];
  }
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'senderId': senderId,
      'dateTime': dateTime,
      'receverid': receverid,
      'image': image,
      'video': video,
      'voice': rec,
    };
  }
}
