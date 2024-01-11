import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  void init() async {
    //TODO: verificar localstorage
    emit(false);
  }

}
