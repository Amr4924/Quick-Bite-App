import 'package:quick_bite/core/Network/api_manager.dart';
import 'package:quick_bite/core/constants/api_endpoint.dart';
import 'package:quick_bite/features/auth/login/model/login_model_data.dart';
import 'package:quick_bite/features/auth/login/model/login_req_model.dart';

class LoginServices {
  ApiManager apiManager;
  LoginServices(this.apiManager);
  Future<LoginModelData> login(LogInRecModel logInRecModel) async {
    final responce = await apiManager.dio.post(
      ApiEndpoints.loginEndpoints,
      data: {"email": logInRecModel.email, "password": logInRecModel.password},
    );
    final Map<String, dynamic> jsonData = responce.data;
    final modelData = LoginModelData.fromJson(jsonData);

    return modelData;
  }
}
