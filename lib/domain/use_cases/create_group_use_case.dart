import 'dart:io';

import 'package:chat_app/domain/repositories/stream_api_repository.dart';
import 'package:chat_app/domain/repositories/upload_storage_repository.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class CreateGroupInput {
  final String name;
  final File? file;
  final List<String> members;

  CreateGroupInput({required this.name, this.file, required this.members});
}

class CreateGroupUseCase {
  final StreamApiRepository streamApiRepository;
  final UploadStorageRepository uploadStorageRepository;

  CreateGroupUseCase(
      {required this.streamApiRepository,
      required this.uploadStorageRepository});

  Future<Channel> createGroup(CreateGroupInput input) async {
    final id = const Uuid().v8();
    String? image;
    if (input.file != null) {
      image =
          await uploadStorageRepository.uploadPhoto(input.file!, 'groups/$id');
    }
    final channel = await streamApiRepository
        .createGroup(id, input.name, input.members, image: image);
    return channel;
  }
}
