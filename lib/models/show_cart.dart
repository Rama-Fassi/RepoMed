class ShowCartModel {
  bool? success;
  List<ShowCartData>? data;
  String? messege;

  ShowCartModel({this.success, this.data, this.messege});

  ShowCartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'][1] != null) {
      data = <ShowCartData>[];
      json['data'][1].forEach((v) {
        data!.add(new ShowCartData.fromJson(v));
      });
    }
    messege = json['messege'];
  }
}

class ShowCartData {
  int? order_id;
  int? cart_id;
  int? quantity;
  String? medicineName;

  ShowCartData({this.cart_id, this.quantity, this.medicineName, this.order_id});

  ShowCartData.fromJson(Map<String, dynamic> json) {
    medicineName = json['medicines_name'];
    quantity = json['quantity'];
    cart_id = json['cart_id'];
    order_id = json['id'];
  }
}
