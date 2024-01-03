class SalesReportsModel {
  bool? success;
  List<SalesReportData>? data;
  String? messege;

  SalesReportsModel({this.success, this.data, this.messege});

  SalesReportsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <SalesReportData>[];
      json['data'].forEach((v) {
        data!.add(new SalesReportData.fromJson(v));
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

class SalesReportData {
  String? productName;
  dynamic? totalProductSales;

  SalesReportData({this.productName, this.totalProductSales});

  SalesReportData.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    totalProductSales = json['total_sales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['total_sales'] = this.totalProductSales;
    return data;
  }
}
