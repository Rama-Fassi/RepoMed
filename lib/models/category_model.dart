class CategoryModel {
  bool? success;
  List<CategoriesData>? data;
  String? messege;

  CategoryModel({this.success, this.data, this.messege});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CategoriesData>[];
      json['data'].forEach((v) {
        data!.add(new CategoriesData.fromJson(v));
      });
    }
    messege = json['messege'];
  }
}

class CategoriesData {
  int? id;
  String? name;

  CategoriesData({
    this.id,
    this.name,
  });

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
