import 'package:chat_app/domain/models/chat_user.dart';
import 'package:chat_app/domain/repositories/stream_api_repository.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamApiRepositoryImpl implements StreamApiRepository {
  final StreamChatClient _client;

  StreamApiRepositoryImpl({required StreamChatClient client})
      : _client = client;

  @override
  Future<bool> connectIfExists(String userId) {
    // TODO: implement connectIfExists
    throw UnimplementedError();
  }

  @override
  Future<ChatUser> connectUser(ChatUser user, String token) async {
    Map<String, dynamic> extraData = {};
    if (user.image != null) {
      extraData['image'] = user.image;
    }
    extraData['name'] = user.name;
    await _client.connectUser(User(id: user.id, extraData: extraData), token);
    return user;
  }

  @override
  Future<Channel> createGroup(String id, String name, List<String> members,
      {String? image}) async {
    // TODO: implement createGroup
    throw UnimplementedError();
  }

  @override
  Future<Channel> createSingleChat(String friendId) {
    // TODO: implement createSingleChat
    throw UnimplementedError();
  }

  @override
  Future<List<ChatUser>> getChatUsers() {
    // TODO: implement getChatUsers
    throw UnimplementedError();
  }

  @override
  Future<String> getToken(String userId) {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
