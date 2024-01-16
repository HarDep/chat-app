import 'package:chat_app/domain/models/auth_user.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<AuthUser?> getAuthUser() async {
    await Future.delayed(const Duration(seconds: 2));
    // TODO: implement getAuthUser
    return AuthUser(id: 'user');
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
  }

  @override
  Future<AuthUser?> signIn() async {
    await Future.delayed(const Duration(seconds: 2));
    // TODO: implement signIn
    return AuthUser(id: 'user');
  }
}
