import 'dart:io';
import 'dart:ui';

class AllMedicineModel {
  bool? success;
  List<AllMedicineData>? data;
  String? messege;

  AllMedicineModel({this.success, this.data, this.messege});

  AllMedicineModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <AllMedicineData>[];
      json['data'].forEach((v) {
        data!.add(new AllMedicineData.fromJson(v));
      });
    }
    messege = json['messege'];
  }
}

class AllMedicineData {
  int? id;
  String? scientificName;
  String? tradeName;
  String? companyName;
  String? categoriesName;
  int? quantity;
  int? price;
  String? form;
  File? photo;
  String? details;
  String? expirationAt;

  AllMedicineData({
    this.id,
    this.scientificName,
    this.tradeName,
    this.companyName,
    this.categoriesName,
    this.quantity,
    this.price,
    this.form,
    this.photo,
    this.details,
    this.expirationAt,
  });

  AllMedicineData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scientificName = json['scientific_name'];
    tradeName = json['trade_name'];
    companyName = json['company_name'];
    categoriesName = json['categories_name'];
    quantity = json['quantity'];
    price = json['price'];
    form = json['form'];
    details = json['details'];
    expirationAt = json['expiration_at'];
  }
}
