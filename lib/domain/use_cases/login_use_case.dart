import 'package:chat_app/domain/exceptions/auth_exception.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:chat_app/domain/repositories/stream_api_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;
  final StreamApiRepository streamApiRepository;

  LoginUseCase(
      {required this.authRepository, required this.streamApiRepository});

  Future<bool> validateLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = await authRepository.getAuthUser();
    if (user != null) {
      final result = await streamApiRepository.connectIfExists(user.id);
      if (result) {
        return result;
      }
      throw AuthException(code: AuthErrorCode.notChatUser);
    }
    throw AuthException(code: AuthErrorCode.notAuth);
  }
}
