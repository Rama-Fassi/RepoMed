class UpdateCartModel {
  bool? success;
  UpdateCartData? data;
  String? messege;

  UpdateCartModel({this.success, this.data, this.messege});

  UpdateCartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data =
        json['data'] != null ? new UpdateCartData.fromJson(json['data']) : null;
    messege = json['messege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['messege'] = this.messege;
    return data;
  }
}

class UpdateCartData {
  int? id;
  int? userId;
  String? status;
  String? paidStatus;
  String? createdAt;
  String? updatedAt;

  UpdateCartData(
      {this.id,
      this.userId,
      this.status,
      this.paidStatus,
      this.createdAt,
      this.updatedAt});

  UpdateCartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    paidStatus = json['paid_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['paid_status'] = this.paidStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
