import 'dart:io';

import 'package:chat_app/domain/models/auth_user.dart';
import 'package:chat_app/domain/models/chat_user.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:chat_app/domain/repositories/stream_api_repository.dart';
import 'package:chat_app/domain/repositories/upload_storage_repository.dart';

class ProfileInput {
  final String name;
  final File file;

  ProfileInput({required this.name, required this.file});
}

class ProfileSignInUseCase {
  final AuthRepository authRepository;
  final UploadStorageRepository uploadStorageRepository;
  final StreamApiRepository streamApiRepository;

  ProfileSignInUseCase(
      {required this.authRepository,
      required this.uploadStorageRepository,
      required this.streamApiRepository});

  Future<void> verify(ProfileInput input) async {
    final auth = await authRepository.getAuthUser();
    final token = await streamApiRepository.getToken(auth!.id);
    //TODO: si no escogo imagen?
    final image = await uploadStorageRepository.uploadPhoto(
        input.file, 'users/${auth.id}');
    await streamApiRepository.connectUser(
        ChatUser(name: input.name, id: auth.id, image: image), token);
  }

  Future<AuthUser?> signIn() async {
    final user = await authRepository.signIn();
    return user;
  }
}
