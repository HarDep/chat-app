import 'package:chat_app/domain/repositories/local_storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  final LocalStorageRepository localStorageRepository;
  ThemeCubit(this.localStorageRepository) : super(false);

  void init() async {
    final isDarkMode = await localStorageRepository.isDarkMode();
    emit(isDarkMode);
  }

  void change(bool isDark) async {
    await localStorageRepository.updateIsDarkMode(isDark);
    emit(isDark);
  }
}
