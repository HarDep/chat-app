import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/presentation/providers/theme_cubit.dart';
import 'package:chat_app/presentation/screens/splash_screen.dart';
import 'package:chat_app/utils/dependencies_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env',);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _streamChatClient = StreamChatClient('u3377bevwec2');
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: buildRepositories(_streamChatClient),
      child: BlocProvider(
        create: (context) => ThemeCubit(context.read())..init(),
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
