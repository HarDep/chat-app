import 'package:chat_app/domain/use_cases/logout_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<void> {
  final LogoutUseCase logoutUseCase;
  SettingCubit(this.logoutUseCase) : super(null);

  void logout() async {
    await logoutUseCase.logout();
    emit(null);
  }
}
