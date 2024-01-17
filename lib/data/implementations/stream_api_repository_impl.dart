import 'package:chat_app/domain/models/chat_user.dart';
import 'package:chat_app/domain/repositories/stream_api_repository.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamApiRepositoryImpl implements StreamApiRepository {
  final StreamChatClient _client;

  StreamApiRepositoryImpl({required StreamChatClient client})
      : _client = client;

  @override
  Future<bool> connectIfExists(String userId) async {
    final token = await getToken(userId);
    await _client.connectUser(User(id: userId), token);
    return _client.state.currentUser != null;
  }

  @override
  Future<ChatUser> connectUser(ChatUser user, String token) async {
    Map<String, dynamic> extraData = {};
    if (user.image != null) {
      extraData['image'] = user.image;
    }
    extraData['name'] = user.name;
    await _client.disconnectUser();
    await _client.connectUser(User(id: user.id, extraData: extraData), token);
    return user;
  }

  @override
  Future<Channel> createGroup(String id, String name, List<String> members,
      {String? image}) async {
    Map<String, dynamic> extraData = {
      'name': name,
      'members': [_client.state.currentUser!.id, ...members],
    };
    if(image != null){
      extraData['image'] = image;
    }
    final channel = _client.channel('messaging', id: id, extraData: extraData);
    await channel.watch();
    return channel;
  }

  @override
  Future<Channel> createSingleChat(String friendId) async {
    //TODO: y si ya existe?
    final channel = _client.channel('messaging',
        id: '${_client.state.currentUser!.id.hashCode}${friendId.hashCode}',
        extraData: {
          'members': [friendId, _client.state.currentUser!.id],
        });
    await channel.watch();
    return channel;
  }

  @override
  Future<List<ChatUser>> getChatUsers() async {
    final result = await _client.queryUsers();
    final chatUsers = result.users
        .where((elem) => elem.id != _client.state.currentUser!.id)
        .map((e) => ChatUser(
              name: e.name,
              id: e.id,
              image: e.extraData['image'] as String,
            ))
        .toList();
    return chatUsers;
  }

  @override
  Future<String> getToken(String userId) async {
    //TODO: token
    final token = _client.devToken(userId).rawValue;
    return token;
  }

  @override
  Future<void> logout() async {
    await _client.disconnectUser();
  }
}
