import 'package:chat_app/presentation/screens/sign_in_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              //TODO: si esta logeado a pagina principal, 
              //si no y no esta autenticado entonces ir a signin, 
              //y si ya esta autenticado pero no a creado cuenta ir a verifyprofile
              pushReplacementPage(context, const SignInScreen());
            },
            child: const Text('iniciar'),
          ),
        ),
      ),
    );
  }
}
