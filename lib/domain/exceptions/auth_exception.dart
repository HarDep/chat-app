enum AuthErrorCode { notAuth, notChatUser }

class AuthException implements Exception {
  final AuthErrorCode code;

  AuthException({required this.code});
}
