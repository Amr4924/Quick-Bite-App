import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_state.dart';

class AuthSwitchCubit extends Cubit<AuthSwitchState> {
  AuthSwitchCubit() : super(AuthSwitchState(isLogin: true));
  
  void switchLogin() {
    emit(AuthSwitchState(isLogin: true));
  }

  void switchSignUp() {
    emit(AuthSwitchState(isLogin: false));
  }
}
