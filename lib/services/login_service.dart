import '../helper/api.dart';
import '../models/login_response.dart';

class LoginService {
  Future<LoginResponseModel> loginUser({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'http://127.0.0.1:8000/api/WareHouse/login',
      body: {
        'email': email,
        'password': password,
      },
    );

    LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(data);
    return loginResponseModel;
  }
}
