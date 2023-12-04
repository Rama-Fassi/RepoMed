import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:repomed/services/add_medicine_service.dart';

import '../../helper/api.dart';
import '../../models/all_medicine_model.dart';
import '../../models/add_medicine_models.dart';
import '../../models/login_response.dart';
import '../auth_cubit/auth_cubit.dart';
part 'all_api_status.dart';

class AllApiCubit extends Cubit<AllApiState> {
  AllApiCubit() : super(AllApiInitial());

  static AllApiCubit get(context) => BlocProvider.of(context);

  /// all medicine service

  allMedicine(context) async {
    emit(AllMedicineLoading());
    try {
      await getAllMedicine(context);

      emit(AllMedicineSuccess());
    } catch (e) {
      emit(AllMedicineFailur(e.toString()));
    }
  }

  AllMedicineModel? allMedicineModel;

  Future<List<AllMedicineData>?> getAllMedicine(context) async {
    await Api()
        .get(
      url: 'http://127.0.0.1:8000/api/Pharmacy/medicines',
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    )
        .then((value) {
      allMedicineModel = AllMedicineModel.fromJson(value);
    });
  }

  /// Add medicine cubit

  AddMedicineModel? addMedicineModel;
  addMedicine({
    required BuildContext context,
    required String categoryName,
    required String scientificName,
    required String tradeName,
    required String companyName,
    required String categoriesName,
    required String quantity,
    required String expirationAt,
    required String price,
    required String form,
    required String details,
  }) async {
    emit(AddMedicineLoading());
    try {
      await postMedicine(
        context: context,
        categoryName: categoryName,
        scientificName: scientificName,
        tradeName: tradeName,
        companyName: companyName,
        categoriesName: categoriesName,
        quantity: quantity,
        price: price,
        form: form,
        details: details,
        expirationAt: expirationAt,
      );
      emit(AddMedicineSuccess());
    } catch (e) {
      emit(AddMedicineFailure(e.toString()));
    }
  }

  Future<AddMedicineModel> postMedicine({
    required BuildContext context,
    required String categoryName,
    required String scientificName,
    required String tradeName,
    required String companyName,
    required String categoriesName,
    required String quantity,
    required String expirationAt,
    required String price,
    required String form,
    required String details,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'http://127.0.0.1:8000/api/WareHouse/medicines',
      body: {
        'name': categoryName,
        'scientific_name': scientificName,
        'trade_name': tradeName,
        'company_name': companyName,
        'categories_name': categoriesName,
        'quantity': quantity,
        'price': price,
        'form': form,
        'details': details,
        'expiration_at': expirationAt,
      },
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    );
    return AddMedicineModel.fromJson(data);
  }
}
