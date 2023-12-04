import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/helper/api.dart';
import 'package:repomed/models/add_medicine_models.dart';
import '../cubits/auth_cubit/auth_cubit.dart';

class AddMedicineService {
  Future<AddMedicineModel> addMedicine({
    required String scientificName,
    required String tradeName,
    required String companyName,
    required String categoriesName,
    required String quantity,
    required String expirationAt,
    required String price,
    required String form,
    required String details,
    String? createdAt,
    String? updatedAt,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'http://127.0.0.1:8000/api/WareHouse/medicines',
      body: {
        'scientific_name': scientificName,
        'trade_name': tradeName,
        'company_name': companyName,
        'categories_name': categoriesName,
        'quantity': quantity,
        'price': price,
        'form': form,
        'details': details,
        'expiration_at': expirationAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
      },
      token: AuthCubit.get(AuthCubit()).loginResponseModel!.data!.token,
    );
    return AddMedicineModel.fromJson(data);
  }
}
