import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:chat_app/domain/repositories/stream_api_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;
  final StreamApiRepository streamApiRepository;

  LoginUseCase(
      {required this.authRepository, required this.streamApiRepository});

  Future<bool> validateLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    //TODO: validar login
    return false;
  }
}
