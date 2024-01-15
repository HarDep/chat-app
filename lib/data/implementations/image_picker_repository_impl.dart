import 'dart:io';
import 'package:chat_app/domain/repositories/image_picker_repository.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerRepositoryImpl implements ImagePickerRepository {
  @override
  Future<File> pickImage() async {
    final picker = ImagePicker();
    final pickerFile =
        await picker.pickImage(source: ImageSource.gallery, maxWidth: 400);
    return File(pickerFile!.path);
  }
}
