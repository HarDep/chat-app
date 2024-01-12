import 'package:chat_app/presentation/providers/profile_verify_cubit.dart';
import 'package:chat_app/presentation/screens/home_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyProfileScreen extends StatelessWidget {
  const VerifyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileVerifyCubit, ProfileState>(
      listener: (context, state) {
        if (state.success) {
          pushReplacementPage(context, const HomeScreeen());
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Verifica tu identidad'),
                const Placeholder(
                  fallbackHeight: 100,
                  fallbackWidth: 100,
                ),
                IconButton(
                  onPressed: () => context.read<ProfileVerifyCubit>().pickImage(),
                  icon: const Icon(Icons.photo),
                ),
                const Text('Pon tu nombre'),
                TextField(
                  controller: context.read<ProfileVerifyCubit>().nameController,
                  decoration: const InputDecoration(
                      hintText: 'Como quieres que te reconozcan'),
                ),
                ElevatedButton(
                  onPressed: () => context.read<ProfileVerifyCubit>().getReady(),
                  child: const Text('Comenzar a chatear'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
