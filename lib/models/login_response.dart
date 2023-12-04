class LoginResponseModel {
  bool? success;
  Data? data;
  String? messege;

  LoginResponseModel({this.success, this.data, this.messege});

  LoginResponseModel.fromJson(Map<String, dynamic> jsonData) {
    success = jsonData['success'];
    data = jsonData['data'] != null ? Data.fromJson(jsonData['data']) : null;
    messege = jsonData['messege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['messege'] = this.messege;
    return data;
  }
}

class Data {
  String? token;
  String? name;
  Data({
    this.token,
    this.name,
  });

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    return data;
  }
}
