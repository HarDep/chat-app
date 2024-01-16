import 'package:chat_app/domain/exceptions/auth_exception.dart';
import 'package:chat_app/domain/use_cases/login_use_case.dart';
import 'package:chat_app/domain/use_cases/profile_sign_in_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SignInState { none, existingUser, }

class SignInCubit extends Cubit<SignInState> {
  final LoginUseCase loginUseCase;
  final ProfileSignInUseCase profileSignInUseCase;
  SignInCubit(this.loginUseCase, this.profileSignInUseCase)
      : super(SignInState.none);

  void signIn() async {
    final result = await profileSignInUseCase.signIn();
    if(result != null){
      try {
        final result = await loginUseCase.validateLogin();
        if (result) {
          emit(SignInState.existingUser);
        }
      } on AuthException {
        emit(SignInState.none);
      }
    }
  }
}
