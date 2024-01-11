import 'package:chat_app/presentation/screens/channel_page.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late final controller = StreamChannelListController(
      client: StreamChat.of(context).client,
      filter: Filter.in_(
        'members',
        [StreamChat.of(context).currentUser!.id],
      ),
      channelStateSort: const [SortOption('last_message_at')],
    );
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: controller.refresh,
          child: StreamChannelListView(
            controller: controller,
            onChannelTap: (channel) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ChannelPage(),
              ),
            ),
          ),
        ),
    );
  }
}