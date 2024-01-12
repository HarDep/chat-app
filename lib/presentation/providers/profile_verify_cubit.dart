import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileState {
  final File? file;
  final bool success;

  ProfileState({this.file, this.success = false});
}

class ProfileVerifyCubit extends Cubit<ProfileState> {
  final nameController = TextEditingController();

  ProfileVerifyCubit() : super(ProfileState());

  void pickImage() {
    //TODO: lamar servicios
    final file = File('');
    // final name = nameController.text;
    emit(ProfileState(file: file));
  }

  void getReady() async {
    //TODO: crear cuenta
    await Future.delayed(const Duration(seconds: 2));
    final file = state.file;
    emit(ProfileState(file: file, success: true));
  }
}
