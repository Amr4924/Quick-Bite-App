import 'package:quick_bite/core/Network/api_manager.dart';
import 'package:quick_bite/core/constants/api_endpoint.dart';
import 'package:quick_bite/features/auth/sign_up/model/signup_req_model.dart';
import 'package:quick_bite/features/auth/sign_up/model/signup_res_model.dart';

class SignUpServices {
  ApiManager apiManager;
  SignUpServices(this.apiManager);
  Future<SignUpResModel> signup(SignupReqModel signUpReqModel) async {
    final response = await apiManager.dio.post(
      ApiEndpoints.signUpEndpoints,
      data: {
        "name": signUpReqModel.fullname,
        "email": signUpReqModel.email,
        "password": signUpReqModel.password,
        "role": "customer",
        "avatar": "https://i.pinimg.com/1200x/0f/d8/fa/0fd8fa00f55e374317873eab0dcf90da.jpg",
      },
    );
    final jsonData = response.data;
    final modelData = SignUpResModel.fromJson(jsonData);
    return modelData;
  }
}
