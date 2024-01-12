import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<void> {
  SettingCubit() : super(null);

  void logout() {
    //TODO: hacer logout
    emit(null);
  }
}
