class CartModel {
  bool? success;
  List<CartData>? data;
  String? messege;

  CartModel({this.success, this.data, this.messege});

  CartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CartData>[];
      json['data'].forEach((v) {
        data!.add(CartData.fromJson(v));
      });
    }
    messege = json['messege'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['messege'] = this.messege;
    return data;
  }
}

class CartData {
  int? id;
  int? userId;
  String? status;
  String? paidStatus;
  String? createdAt;

  CartData(
      {this.id, this.userId, this.status, this.paidStatus, this.createdAt});

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    paidStatus = json['paid_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['paid_status'] = this.paidStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
