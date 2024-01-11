import 'package:flutter/material.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Verifica tus datos'),
              const Placeholder(
                fallbackHeight: 100,
                fallbackWidth: 100,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.photo),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Nombre del grupo',
                ),
              ),
              Wrap(
                children: List.generate(
                  5,
                  (index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [const CircleAvatar(), Text('User $index')],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {}, 
                child: const Text('Crear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
