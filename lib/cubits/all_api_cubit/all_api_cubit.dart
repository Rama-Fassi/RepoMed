import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:repomed/models/cart_model.dart';
import 'package:repomed/models/order_model.dart';
import 'package:repomed/models/show_cart.dart';
import '../../helper/api.dart';
import '../../models/add_category_model.dart';
import '../../models/all_medicine_model.dart';
import '../../models/add_medicine_models.dart';
import '../../models/category_model.dart';
import '../../models/login_response.dart';
import '../../models/medicine_model.dart';
import '../../models/update_cart_model.dart';
import '../auth_cubit/auth_cubit.dart';
part 'all_api_status.dart';

class AllApiCubit extends Cubit<AllApiState> {
  AllApiCubit() : super(AllApiInitial());

  static AllApiCubit get(context) => BlocProvider.of(context);

  /// all categories
  allCategory(context) async {
    emit(AllCategoriesLoading());
    try {
      await getAllCategory(context);

      emit(AllCategoriesSuccess());
    } catch (e) {
      emit(AllCategoriesFailur(e.toString()));
    }
  }

  CategoryModel? categoryModel;
  Future<List<Data>?> getAllCategory(context) async {
    await Api()
        .get(
      url: 'http://127.0.0.1:8000/api/WareHouse/category',
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    )
        .then((value) {
      categoryModel = CategoryModel.fromJson(value);
    });
  }

  /// Add Category
  AddCategory? addCategory1;
  addCategory({
    required BuildContext context,
    required String categoryName,
  }) async {
    emit(AddCategoryLoading());
    try {
      await postCategory(
        context: context,
        categoryName: categoryName,
      );
      emit(AddCategorySuccess());
    } catch (e) {
      emit(AddCategoryFailure(e.toString()));
    }
  }

  Future<AddCategory> postCategory({
    required BuildContext context,
    required String categoryName,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'http://127.0.0.1:8000/api/WareHouse/category',
      body: {
        'name': categoryName,
      },
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    );
    return AddCategory.fromJson(data);
  }

  /// Category medicine

  medicine(context, {required int id}) async {
    emit(MedicineLoading());

    try {
      await getMedicine(context, id: id);
      emit(MedicineSuccess());
    } catch (e) {
      emit(MedicineFailure(e.toString()));
    }
  }

  CategoryMedicineModel? categorymedicinesModel;
  Future<Map<String, dynamic>?> getMedicine(context, {required int id}) async {
    await Api()
        .get(
      url: 'http://127.0.0.1:8000/api/WareHouse/category/$id',
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    )
        .then((value) {
      print(value);
      categorymedicinesModel = CategoryMedicineModel.fromJson(value);
    });
  }

  /// all medicine service

  allMedicine(context) async {
    emit(AllMedicineLoading());
    try {
      await getAllMedicine(context);

      emit(AllMedicineSuccess());
    } catch (e) {
      emit(AllMedicineFailure(e.toString()));
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

  /// all medicine details service

  allMedicineDetails(context) async {
    emit(AllMedicineDetailsLoading());
    try {
      await getAllMedicine(context);

      emit(AllMedicineDetailsSuccess());
    } catch (e) {
      emit(AllMedicineDetailsFailur(e.toString()));
    }
  }

  AllMedicineModel? allMedicineDetailsModel;

  Future<List<AllMedicineData>?> getAllMedicineDetails(context) async {
    await Api()
        .get(
      url: 'http://127.0.0.1:8000/api/Pharmacy/medicines',
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    )
        .then((value) {
      allMedicineModel = AllMedicineModel.fromJson(value);
    });
  }

  /// Add medicine
  AddMedicineModel? addMedicineModel;
  addMedicine({
    required BuildContext context,
    required String scientificName,
    required String tradeName,
    required String companyName,
    required String categoriesName,
    required String quantity,
    required String expirationAt,
    required String price,
    required String form,
    required String details,
    Uint8List? photo,
  }) async {
    emit(AddMedicineLoading());
    try {
      await postMedicine(
        context: context,
        scientificName: scientificName,
        tradeName: tradeName,
        companyName: companyName,
        categoriesName: categoriesName,
        quantity: quantity,
        price: price,
        form: form,
        details: details,
        expirationAt: expirationAt,
        photo: photo,
      );
      emit(AddMedicineSuccess());
    } catch (e) {
      emit(AddMedicineFailure(e.toString()));
    }
  }

  Future<AddMedicineModel> postMedicine({
    required BuildContext context,
    required String scientificName,
    required String tradeName,
    required String companyName,
    required String categoriesName,
    required String quantity,
    required String expirationAt,
    required String price,
    required String form,
    required String details,
    Uint8List? photo,
  }) async {
    Map<String, dynamic> data = await Api().postWithFile(
        url: 'http://127.0.0.1:8000/api/WareHouse/medicines',
        jsonData: {
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
        file: photo);

    return AddMedicineModel.fromJson(data);
  }

  ///All Carts
  allCarts(context) async {
    emit(AllCartsLoading());
    try {
      await getAllCarts(context);
      emit(AllCartsSuccess());
    } catch (e) {
      emit(AllCartsFailure(e.toString()));
    }
  }

  CartModel? cartModel;

  Future<List<AllMedicineData>?> getAllCarts(context) async {
    await Api()
        .get(
      url: 'http://127.0.0.1:8000/api/WareHouse/carts',
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    )
        .then((value) {
      cartModel = CartModel.fromJson(value);
    });
  }

  /// Show Cart
  showCart(context, {required int? id}) async {
    emit(ShowCartLoading());

    try {
      await showCartOrders(context, id: id);
      emit(ShowCartSuccess());
    } catch (e) {
      emit(ShowCartFailure(e.toString()));
    }
  }

  ShowCartModel? showCartModel;
  Future<Map<String, dynamic>?> showCartOrders(context,
      {required int? id}) async {
    await Api()
        .get(
      url: 'http://127.0.0.1:8000/api/WareHouse/cart/$id',
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    )
        .then((value) {
      showCartModel = ShowCartModel.fromJson(value);
    });
  }

  /// All Orders
  allOrders(context) async {
    emit(AllOrdersLoading());
    try {
      await getAllOrders(context);
      emit(AllOdersSuccess());
    } catch (e) {
      emit(AllOrdersFailure(e.toString()));
    }
  }

  OrderModel? orderModel;

  Future<List<AllMedicineData>?> getAllOrders(context) async {
    await Api()
        .get(
      url: 'http://127.0.0.1:8000/api/WareHouse/order/index/',
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    )
        .then((value) {
      orderModel = OrderModel.fromJson(value);
    });
  }

  /// update cart
  UpdateCartModel? updateCartModel;
  updateCart({
    required BuildContext context,
    String? status,
    String? paid_status,
    required int id,
  }) async {
    emit(UpdateCartLoading());
    try {
      await putCart(
        context: context,
        id: id,
        status: status,
        paid_status: paid_status,
      );
      emit(UpdateCartSuccess());
    } catch (e) {
      emit(UpdateCartFailure(e.toString()));
    }
  }

  Future<UpdateCartModel> putCart(
      {required BuildContext context,
      String? status,
      String? paid_status,
      required int id}) async {
    Map<String, dynamic> data = await Api().put(
      url: 'http://127.0.0.1:8000/api/WareHouse/cart/$id',
      body: {"paid_status": paid_status, "status": status},
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    );
    return UpdateCartModel.fromJson(data);
  }
}
