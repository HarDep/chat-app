import 'package:chat_app/presentation/providers/chats_selection_cubit.dart';
import 'package:chat_app/presentation/providers/create_group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupScreen extends StatelessWidget {
  final List<ChatUserState> selectedUsers;
  const CreateGroupScreen({super.key, required this.selectedUsers});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateGroupCubit(selectedUsers),
      child: BlocConsumer<CreateGroupCubit, CreationGroupState>(
        listener: (context, state) {
          // TODO: implementar cambiar foto o crear grupo
        },
        builder: (context, state) {
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
                      onPressed: () {
                        //TODO: cambiar foto
                      },
                      icon: const Icon(Icons.photo),
                    ),
                    TextField(
                      controller: context.read<CreateGroupCubit>().nameTextController,
                      decoration: const InputDecoration(
                        hintText: 'Nombre del grupo',
                      ),
                    ),
                    Wrap(
                      children: List.generate(
                        selectedUsers.length,
                        (index) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(),
                            Text(selectedUsers[index].chatUser.name)
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //TODO: crear grupo
                      },
                      child: const Text('Crear'),
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
