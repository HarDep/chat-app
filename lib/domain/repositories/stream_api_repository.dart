import 'package:chat_app/domain/models/chat_user.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

abstract class StreamApiRepository {
  Future<List<ChatUser>> getChatUsers();
  Future<String> getToken(String userId);
  Future<bool> connectIfExists(String userId);
  Future<ChatUser> connectUser(ChatUser user, String token);
  Future<Channel> createGroup(String id, String name, List<String> members,
      {String? image});
  Future<Channel> createSingleChat(String friendId);
  Future<void> logout();
}
