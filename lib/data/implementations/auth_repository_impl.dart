import 'package:chat_app/domain/models/auth_user.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Future<AuthUser?> getAuthUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      return AuthUser(id: user.uid);
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<AuthUser?> signIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final OAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        UserCredential userCredential;
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
        final user = userCredential.user;
        if (user != null) {
          return AuthUser(id: user.uid);
        }
      }
      return null;
    } on Exception catch (e) {
      //TODO: llega aqui
      print(e);
      throw Exception('sign in error $e');
    }
  }
}
