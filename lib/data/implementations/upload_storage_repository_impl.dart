import 'dart:io';
import 'package:chat_app/domain/repositories/upload_storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadStorageRepositoryImpl implements UploadStorageRepository {
  @override
  Future<String> uploadPhoto(File file, String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final upload = ref.putFile(file);
    await upload;
    return ref.getDownloadURL();
  }
}
