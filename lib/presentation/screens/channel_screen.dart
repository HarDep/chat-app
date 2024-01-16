import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelScreen extends StatelessWidget {
  final Channel channel;
  const ChannelScreen({super.key, required this.channel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamChannel(
        channel: channel,
        child: const Scaffold(
          appBar: StreamChannelHeader(),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: StreamMessageListView(),
                ),
                StreamMessageInput()
              ],
            ),
          ),
        ),
      ),
    );
  }
}