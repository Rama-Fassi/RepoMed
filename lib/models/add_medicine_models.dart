// import 'dart:io';
// import 'dart:typed_data';
//
// class AddMedicineModel {
//   bool? success;
//   List<AddMedicineData>? data;
//   String? messege;
//
//   AddMedicineModel({this.success, this.data, this.messege});
//
//   AddMedicineModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['data'] != null) {
//       data = <AddMedicineData>[];
//       json['data'].forEach((v) {
//         data!.add(new AddMedicineData.fromJson(v));
//       });
//     }
//     messege = json['messege'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['messege'] = this.messege;
//     return data;
//   }
// }
//
// class AddMedicineData {
//   String? scientificName;
//   String? tradeName;
//   String? companyName;
//   String? categoriesName;
//   String? quantity;
//   String? expirationAt;
//   String? price;
//   String? form;
//   String? details;
//   Uint8List? photo;
//
//   AddMedicineData(
//       {this.scientificName,
//       this.tradeName,
//       this.companyName,
//       this.categoriesName,
//       this.quantity,
//       this.expirationAt,
//       this.price,
//       this.form,
//       this.details,
//       this.photo});
//
//   AddMedicineData.fromJson(Map<String, dynamic> json) {
//     scientificName = json[1]['scientific_name'];
//     tradeName = json[1]['trade_name'];
//     companyName = json[1]['company_name'];
//     categoriesName = json[1]['categories_name'];
//     quantity = json[1]['quantity'];
//     expirationAt = json[1]['expiration_at'];
//     price = json[1]['price'];
//     form = json[1]['form'];
//     details = json[1]['details'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['scientific_name'] = this.scientificName;
//     data['trade_name'] = this.tradeName;
//     data['company_name'] = this.companyName;
//     data['categories_name'] = this.categoriesName;
//     data['quantity'] = this.quantity;
//     data['expiration_at'] = this.expirationAt;
//     data['price'] = this.price;
//     data['form'] = this.form;
//     data['details'] = this.details;
//     return data;
//   }
// }

import 'dart:io';

class AddMedicineModel {
  bool? success;
  AddMedicineData? data;
  String? messege;

  AddMedicineModel({this.success, this.data, this.messege});

  AddMedicineModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? AddMedicineData.fromJson(json['data']) : null;
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

class AddMedicineData {
  int? id;
  String? scientificName;
  String? tradeName;
  String? companyName;
  String? categoriesName;
  String? quantity;
  String? price;
  String? photo;
  String? form;
  String? details;
  String? expirationAt;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  AddMedicineData({
    this.id,
    this.scientificName,
    this.tradeName,
    this.companyName,
    this.categoriesName,
    this.quantity,
    this.price,
    this.photo,
    this.form,
    this.details,
    this.expirationAt,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  AddMedicineData.fromJson(Map<String, dynamic> json) {
    scientificName = json['scientific_name'];
    tradeName = json['trade_name'];
    companyName = json['company_name'];
    categoriesName = json['categories_name'];
    quantity = json['quantity'];
    price = json['price'];
    photo = json['photo'];
    form = json['form'];
    details = json['details'];
    expirationAt = json['expiration_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scientific_name'] = this.scientificName;
    data['trade_name'] = this.tradeName;
    data['company_name'] = this.companyName;
    data['categories_name'] = this.categoriesName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['photo'] = this.photo;
    data['form'] = this.form;
    data['details'] = this.details;
    data['expiration_at'] = this.expirationAt;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
