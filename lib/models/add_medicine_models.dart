class AddMedicineModel {
  bool? success;
  List<AddMedicineData>? data;
  String? messege;

  AddMedicineModel({this.success, this.data, this.messege});

  AddMedicineModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <AddMedicineData>[];
      json['data'].forEach((v) {
        data!.add(new AddMedicineData.fromJson(v));
      });
    }
    messege = json['messege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'][1] = this.data!.map((v) => v.toJson()).toList();
    }
    data['messege'] = this.messege;
    return data;
  }
}

class AddMedicineData {
  String? categoryName;
  String? scientificName;
  String? tradeName;
  String? companyName;
  String? categoriesName;
  String? quantity;
  String? expirationAt;
  String? price;
  String? form;
  String? details;

  AddMedicineData(this.categoryName,
      {this.scientificName,
      this.tradeName,
      this.companyName,
      this.categoriesName,
      this.quantity,
      this.expirationAt,
      this.price,
      this.form,
      this.details});

  AddMedicineData.fromJson(Map<String, dynamic> json) {
    categoryName = json[0]['name'];
    scientificName = json[1]['scientific_name'];
    tradeName = json[1]['trade_name'];
    companyName = json[1]['company_name'];
    categoriesName = json[1]['categories_name'];
    quantity = json[1]['quantity'];
    expirationAt = json[1]['expiration_at'];
    price = json[1]['price'];
    form = json[1]['form'];
    details = json[1]['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scientific_name'] = this.scientificName;
    data['trade_name'] = this.tradeName;
    data['company_name'] = this.companyName;
    data['categories_name'] = this.categoriesName;
    data['quantity'] = this.quantity;
    data['expiration_at'] = this.expirationAt;
    data['price'] = this.price;
    data['form'] = this.form;
    data['details'] = this.details;
    return data;
  }
}
