import 'package:chat_app/presentation/screens/sign_in_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stream = StreamChat.of(context).client.state.currentUserStream;
    return Scaffold(
      body: StreamBuilder(
        stream: stream,
        builder: (_, builder) {
          if (builder.hasData) {
            final user = builder.data;
            final image = user?.extraData['image'];
            return Center(
              child: Column(
                children: [
                  if (image != null)
                    Image.network(image as String)
                  else
                    const Placeholder(),
                  Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                  ElevatedButton(
                    onPressed: () {
                      pushAndRemoveUntilPage(context, const SignInScreen());
                    },
                    child: const Text('logout'),
                  ),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
