import 'package:chat_app/presentation/providers/settings_cubit.dart';
import 'package:chat_app/presentation/providers/theme_cubit.dart';
import 'package:chat_app/presentation/screens/sign_in_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final image = StreamChat.of(context).client.state.currentUser!.extraData['image'];
    return BlocProvider(
      create: (context) => SettingCubit(context.read()),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              if (image != null)
                Image.network(image as String, height: 100,)
              else
                const Placeholder(),
              BlocBuilder<ThemeCubit, bool>(
                builder: (context, state) {
                  return Switch(
                    value: state,
                    onChanged: (value) =>
                        context.read<ThemeCubit>().change(value),
                  );
                },
              ),
              BlocConsumer<SettingCubit, void>(
                listener: (context, state) {
                  pushAndRemoveUntilPage(context, const SignInScreen());
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () => context.read<SettingCubit>().logout(),
                    child: const Text('logout'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
