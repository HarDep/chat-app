import 'package:flutter/material.dart';

class ChatsSelectionScreen extends StatelessWidget {
  final isGroup = false;
  const ChatsSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedUsers = [];
    return Scaffold(
      floatingActionButton: isGroup && selectedUsers.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                //TODO: ir a la confirmacion de grupo con los usuarios seleccionados
              },
            )
          : null,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                BackButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text(isGroup ? 'Nuevo grupo' : 'Personas'),
              ],
            ),
            if (!isGroup)
              ElevatedButton(
                onPressed: () {},
                child: const Text('Crear grupo'),
              )
            else if (isGroup && selectedUsers.isEmpty)
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(),
                  Text('Añadir integrantes'),
                ],
              )
            else
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedUsers.length,
                  itemBuilder: (_, index) {
                    final chatUser = selectedUsers[index];
                    return Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(),
                            Text(chatUser.name),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    );
                  },
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return ListTile(
                    onTap: () {},
                    leading: const CircleAvatar(),
                    title: Text('User $index'),
                    trailing: isGroup? Checkbox(value: false, onChanged: (value){},) : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
