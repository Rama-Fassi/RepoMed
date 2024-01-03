class UsersReportsModel {
  bool? success;
  List<UsersReportData>? data;
  String? messege;

  UsersReportsModel({this.success, this.data, this.messege});

  UsersReportsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <UsersReportData>[];
      json['data'].forEach((v) {
        data!.add(new UsersReportData.fromJson(v));
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

class UsersReportData {
  String? userName;
  dynamic? totalUsersSales;

  UsersReportData({this.userName, this.totalUsersSales});

  UsersReportData.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    totalUsersSales = json['total_sales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['total_sales'] = this.totalUsersSales;
    return data;
  }
}
