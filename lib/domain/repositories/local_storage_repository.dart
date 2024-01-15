abstract class LocalStorageRepository {
  Future<bool> isDarkMode();
  Future<void> updateIsDarkMode(bool isDarkMode);
}
