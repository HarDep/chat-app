import 'package:chat_app/presentation/providers/splash_cubit.dart';
import 'package:chat_app/presentation/screens/home_screen.dart';
import 'package:chat_app/presentation/screens/sign_in_screen.dart';
import 'package:chat_app/presentation/screens/verify_profile_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state == SplashState.none) {
          pushReplacementPage(context, const SignInScreen());
          return;
        } else if (state == SplashState.newUser) {
          pushReplacementPage(context, const VerifyProfileScreen());
          return;
        }
        pushReplacementPage(context, const HomeScreeen());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Splash'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('iniciar'),
            ),
          ),
        ),
      ),
    );
  }
}
