import 'package:chat_app/models/chat_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatUserState {
  final ChatUser chatUser;
  final bool isSelected;

  ChatUserState({required this.chatUser, this.isSelected = false});
}

class ChatSelectionCubit extends Cubit<List<ChatUserState>> {
  ChatSelectionCubit() : super([]);

  List<ChatUserState> get selectedUsers =>
      state.where((element) => element.isSelected).toList();

  void init() {
    final list = List.generate(
        10,
        (index) => ChatUserState(
            chatUser: ChatUser(name: 'user $index', image: '', id: '$index')));
    emit(list);
  }

  void selectUser(ChatUserState user) {
    final index =
        state.indexWhere((element) => element.chatUser.id == user.chatUser.id);
    state[index] = ChatUserState(
        chatUser: state[index].chatUser, isSelected: !user.isSelected);
    emit(List.from(state));
  }

  /* Future<Channel> createGroup() async {
    //TODO: crear grupo
    return Channel(StreamChatClient(''), '', '');
  } */
}

class IsGroupCubit extends Cubit<bool> {
  IsGroupCubit() : super(false);

  void change() => emit(!state);
}
