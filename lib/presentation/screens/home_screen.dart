import 'package:chat_app/presentation/providers/home_cubit.dart';
import 'package:chat_app/presentation/screens/chats_screen.dart';
import 'package:chat_app/presentation/screens/chats_selection_screen.dart';
import 'package:chat_app/presentation/screens/settings_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<HomeCubit, int>(
                  builder: (context, state) {
                    return IndexedStack(
                      index: state,
                      children: const [
                        ChatsScreen(),
                        SettingsScreen(),
                      ],
                    );
                  },
                ),
              ),
              const _NavigationBar(),
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
            onPressed: () => context.read<HomeCubit>().change(0),
            child: const Text('chats'),
          ),
          FloatingActionButton(
            onPressed: () {
              pushPage(context, const ChatsSelectionScreen());
            },
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () => context.read<HomeCubit>().change(1),
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
