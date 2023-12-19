class AddCategory {
  bool? success;
  CategoryData? data;
  String? messege;

  AddCategory({this.success, this.data, this.messege});

  AddCategory.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data =
        json['data'] != null ? new CategoryData.fromJson(json['data']) : null;
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

class CategoryData {
  String? name;
  String? updatedAt;
  String? createdAt;
  int? id;

  CategoryData({this.name, this.updatedAt, this.createdAt, this.id});

  CategoryData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
