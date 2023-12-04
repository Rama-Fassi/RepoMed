import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/login_response.dart';
import '../../services/login_service.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  LoginResponseModel? loginResponseModel;
  String? token;
  login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      loginResponseModel =
          await LoginService().loginUser(password: password, email: email);
      print(loginResponseModel!.data!.token);
      token = loginResponseModel!.data!.token;
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
