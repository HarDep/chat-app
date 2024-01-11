import 'package:chat_app/presentation/screens/chats_screen.dart';
import 'package:chat_app/presentation/screens/chats_selection_screen.dart';
import 'package:chat_app/presentation/screens/settings_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: 0,
                  children: [
                    ChatsScreen(),
                    SettingsScreen(),
                  ],
                ),
              ),
              _NavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('chats'),
          ),
          FloatingActionButton(
            onPressed: () {
              pushPage(context, const ChatsSelectionScreen());
            },
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
