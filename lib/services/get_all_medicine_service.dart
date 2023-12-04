import 'dart:convert';
import 'package:repomed/models/all_medicine_model.dart';
import 'package:repomed/models/login_response.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../helper/api.dart';

class AllMedicinesService {
  Future<List<AllMedicineModel>> getAllMedicines(context) async {
    // it's Method
    List<dynamic> data = await Api().get(
      url: 'http://127.0.0.1:8000/api/Pharmacy/medicines',
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    );
    List<AllMedicineModel> medicineList = [];
    for (int i = 0; i < data.length; i++) {
      medicineList.add(
        AllMedicineModel.fromJson(data[i]),
      );
    }
    return medicineList;
  }
}
