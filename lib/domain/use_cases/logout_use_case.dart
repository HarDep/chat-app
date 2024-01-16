import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:chat_app/domain/repositories/stream_api_repository.dart';

class LogoutUseCase {
  final StreamApiRepository streamApiRepository;
  final AuthRepository authRepository;

  LogoutUseCase(
      {required this.streamApiRepository, required this.authRepository});

  Future<void> logout() async {
    await streamApiRepository.logout();
    await authRepository.logout();
  }
}
