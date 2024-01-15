import 'package:chat_app/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  @override
  Future<bool> isDarkMode() async {
    await Future.delayed(const Duration(seconds: 1));
    // TODO: implement isDarkMode
    return false;
  }

  @override
  Future<void> updateIsDarkMode(bool isDarkMode) async {
    await Future.delayed(const Duration(seconds: 1));
    // TODO: implement updateIsDarkMode
  }
}
