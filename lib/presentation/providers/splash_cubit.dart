import 'package:chat_app/domain/exceptions/auth_exception.dart';
import 'package:chat_app/domain/use_cases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashState { none, existingUser, newUser }

class SplashCubit extends Cubit<SplashState> {
  final LoginUseCase loginUseCase;
  SplashCubit(this.loginUseCase) : super(SplashState.none);

  void init() async {
    try {
      final result = await loginUseCase.validateLogin();
      if (result) {
        emit(SplashState.existingUser);
      }
    } on AuthException catch (e) {
      if (e.code == AuthErrorCode.notAuth) {
        emit(SplashState.none);
        return;
      }
      emit(SplashState.newUser);
    }
  }
}
