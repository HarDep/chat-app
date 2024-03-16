import 'package:chat_app/presentation/providers/chats_selection_cubit.dart';
import 'package:chat_app/presentation/providers/create_group_cubit.dart';
import 'package:chat_app/presentation/screens/channel_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupScreen extends StatelessWidget {
  final List<ChatUserState> selectedUsers;
  const CreateGroupScreen({super.key, required this.selectedUsers});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateGroupCubit(selectedUsers, context.read(), context.read()),
      child: BlocConsumer<CreateGroupCubit, CreationGroupState>(
        listener: (context, state) {
          if (state.channel != null) {
            pushReplacementPage(context, ChannelScreen(channel: state.channel!));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Verifica tus datos'),
                  if(state.file != null)
                  Image.file(state.file!, height: 100,)
                  else
                  const Placeholder(
                    fallbackHeight: 100,
                    fallbackWidth: 100,
                  ),
                  IconButton(
                    onPressed: () => context.read<CreateGroupCubit>().pickImage(),
                    icon: const Icon(Icons.photo),
                  ),
                  TextField(
                    controller:
                        context.read<CreateGroupCubit>().nameTextController,
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
                    onPressed: () => context.read<CreateGroupCubit>().createGroup(),
                    child: const Text('Crear'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
