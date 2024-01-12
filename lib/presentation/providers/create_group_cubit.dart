import 'dart:io';

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
  final List<ChatUserState> members;
  final nameTextController = TextEditingController();
  CreateGroupCubit(this.members) : super(CreationGroupState());

  void createGroup() {
    //TODO: crear grupo
    emit(CreationGroupState(file: state.file, channel: state.channel));
  }

  void pickImage() async{
    //TODO: poner imagen
    emit(CreationGroupState(file: state.file, channel: state.channel));
  }
}
