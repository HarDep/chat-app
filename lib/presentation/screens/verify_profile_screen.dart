import 'package:chat_app/presentation/screens/home_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';

class VerifyProfileScreen extends StatelessWidget {
  const VerifyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {},
                icon: const Icon(Icons.photo),
              ),
              const Text('Pon tu nombre'),
              const TextField(
                decoration:
                    InputDecoration(hintText: 'Como quieres que te reconozcan'),
              ),
              ElevatedButton(
                onPressed: () {
                  pushReplacementPage(context, const HomeScreeen());
                },
                child: const Text('Comenzar a chatear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
