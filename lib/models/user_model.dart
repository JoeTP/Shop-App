class UserModel {
  bool? status;
  UserModelData? data;

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = UserModelData.fromJson(json['data']);
  }
}

class UserModelData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  dynamic points;
  dynamic credit;
  String? token;

  UserModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}