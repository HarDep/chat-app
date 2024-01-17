import 'package:chat_app/domain/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _isDarkMode = 'ISDARKMODE';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  @override
  Future<bool> isDarkMode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final isDarkMode = sharedPreferences.getBool(_isDarkMode) ?? false;
    return isDarkMode;
  }

  @override
  Future<void> updateIsDarkMode(bool isDarkMode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(_isDarkMode, isDarkMode);
  }
}
