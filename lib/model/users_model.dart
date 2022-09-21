/*  this class For User Data In FireStore */
class UserModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? uId;
  String? image;
  bool? isOnline;

  UserModel(
      {this.name,
      this.email,
      this.password,
      this.phone,
      this.uId,
      this.image,
      this.isOnline});
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    uId = json['uId'];
    image = json['image'];

    isOnline = json['isOnline'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'uId': uId,
      'image': image,
      'isOnline': isOnline,
    };
  }
}
