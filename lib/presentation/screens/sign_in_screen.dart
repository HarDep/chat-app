import 'package:chat_app/presentation/providers/sign_in_cubit.dart';
import 'package:chat_app/presentation/screens/home_screen.dart';
import 'package:chat_app/presentation/screens/verify_profile_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(context.read(), context.read()),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state == SignInState.none) {
            pushReplacementPage(context, const VerifyProfileScreen());
            return;
          }
          pushAndRemoveUntilPage(context, const HomeScreeen());
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Bienvenido a Chat App'),
                    ElevatedButton(
                      onPressed: () {
                        context.read<SignInCubit>().signIn();
                      },
                      child: const Text('Conectar con Google'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
