import 'package:chat_app/domain/models/chat_user.dart';
import 'package:chat_app/domain/repositories/stream_api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatUserState {
  final ChatUser chatUser;
  final bool isSelected;

  ChatUserState({required this.chatUser, this.isSelected = false});
}

class ChatSelectionCubit extends Cubit<List<ChatUserState>> {
  final StreamApiRepository streamApiRepository;
  ChatSelectionCubit(this.streamApiRepository) : super([]);

  List<ChatUserState> get selectedUsers =>
      state.where((element) => element.isSelected).toList();

  void init() async {
    final chats = await streamApiRepository.getChatUsers();
    final list = chats.map((elm) => ChatUserState(chatUser: elm)).toList();
    emit(list);
  }

  void selectUser(ChatUserState user) {
    final index =
        state.indexWhere((element) => element.chatUser.id == user.chatUser.id);
    state[index] = ChatUserState(
        chatUser: state[index].chatUser, isSelected: !user.isSelected);
    emit(List.from(state));
  }

  Future<Channel> createSingleChat(ChatUserState chatUserState) async {
    final channel =
        await streamApiRepository.createSingleChat(chatUserState.chatUser.id);
    return channel;
  }
}

class IsGroupCubit extends Cubit<bool> {
  IsGroupCubit() : super(false);

  void change() => emit(!state);
}
