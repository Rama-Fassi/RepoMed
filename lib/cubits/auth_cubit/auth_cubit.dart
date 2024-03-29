import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../helper/api.dart';
import '../../models/login_response.dart';
import '../../models/logout_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  String baseUrl = 'http://192.168.42.66:8000/api';

  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  LoginResponseModel? loginResponseModel;
  String? token;
  login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      loginResponseModel = await loginUser(password: password, email: email);
      token = loginResponseModel!.data!.token;
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<LoginResponseModel> loginUser({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/WareHouse/login',
      body: {
        'email': email,
        'password': password,
      },
    );

    LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(data);
    return loginResponseModel;
  }

  /// Logout
  logOut(context) async {
    emit(LogoutLoading());
    try {
      await getLogout(context);

      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }

  LogoutModel? logoutModel;
  Future<List<dynamic>?> getLogout(context) async {
    await Api()
        .get(
      url: '$baseUrl/Pharmacy/logout',
      token: AuthCubit.get(context).loginResponseModel!.data!.token,
    )
        .then((value) {
      logoutModel = LogoutModel.fromJson(value);
    });
  }
}
