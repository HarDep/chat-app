import 'dart:io';

import 'package:chat_app/domain/repositories/image_picker_repository.dart';
import 'package:chat_app/domain/use_cases/create_group_use_case.dart';
import 'package:chat_app/presentation/providers/chats_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class CreationGroupState {
  final File? file;
  final Channel? channel;

  CreationGroupState({this.file, this.channel});
}

class CreateGroupCubit extends Cubit<CreationGroupState> {
  final CreateGroupUseCase createGroupUseCase;
  final ImagePickerRepository imagePickerRepository;
  final List<ChatUserState> members;
  final nameTextController = TextEditingController();
  CreateGroupCubit(
      this.members, this.createGroupUseCase, this.imagePickerRepository)
      : super(CreationGroupState());

  void createGroup() async {
    final name = nameTextController.text;
    final membs = members.map((e) => e.chatUser.id).toList();
    final channel = await createGroupUseCase.createGroup(
        CreateGroupInput(name: name, file: state.file, members: membs));
    emit(CreationGroupState(file: state.file, channel: channel));
  }

  void pickImage() async {
    final file = await imagePickerRepository.pickImage();
    emit(CreationGroupState(file: file, channel: state.channel));
  }
}
