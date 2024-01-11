import 'package:chat_app/presentation/providers/theme_cubit.dart';
import 'package:chat_app/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _streamChatClient = StreamChatClient('');
  MyApp({super.key});

  void connectUser() async {
    await _streamChatClient.disconnectUser();
    _streamChatClient.connectUser(
        User(id: 'us1'), _streamChatClient.devToken('').rawValue);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [],
      child: BlocProvider(
        create: (_) => ThemeCubit()..init(),
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (_, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'ChatApp',
              theme: state ? ThemeData.dark() : ThemeData.light(),
              home: const SplashScreen(),
              builder: (_, child) =>
                  StreamChat(client: _streamChatClient, child: child),
            );
          },
        ),
      ),
    );
  }
}
