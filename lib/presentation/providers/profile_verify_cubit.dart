import 'dart:io';
import 'package:chat_app/domain/repositories/image_picker_repository.dart';
import 'package:chat_app/domain/use_cases/profile_sign_in_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileState {
  final File? file;
  final bool success;

  ProfileState({this.file, this.success = false});
}

class ProfileVerifyCubit extends Cubit<ProfileState> {
  final nameController = TextEditingController();
  final ImagePickerRepository imagePickerRepository;
  final ProfileSignInUseCase profileSignInUseCase;

  ProfileVerifyCubit(this.imagePickerRepository, this.profileSignInUseCase)
      : super(ProfileState());

  void pickImage() async {
    final file = await imagePickerRepository.pickImage();
    emit(ProfileState(file: file));
  }

  void getReady() async {
    final file = state.file;
    final name = nameController.text;
    await profileSignInUseCase.verify(ProfileInput(name: name, file: file!));
    emit(ProfileState(file: file, success: true));
  }
}
