import 'package:chat_app/presentation/providers/chats_selection_cubit.dart';
import 'package:chat_app/presentation/screens/channel_screen.dart';
import 'package:chat_app/presentation/screens/create_group_screen.dart';
import 'package:chat_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsSelectionScreen extends StatelessWidget {
  const ChatsSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => IsGroupCubit()),
        BlocProvider(
            create: (context) => ChatSelectionCubit(context.read())..init()),
      ],
      child: BlocBuilder<IsGroupCubit, bool>(
        builder: (context, isGroup) {
          return BlocBuilder<ChatSelectionCubit, List<ChatUserState>>(
            builder: (context, chatsState) {
              final selectedUsers =
                  context.read<ChatSelectionCubit>().selectedUsers;
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text( isGroup? 'Nuevo grupo' : 'Contactos'),
                ),
                floatingActionButton: isGroup && selectedUsers.isNotEmpty
                    ? FloatingActionButton(
                        onPressed: () => 
                        pushReplacementPage(context, CreateGroupScreen(selectedUsers: selectedUsers,),),
                      )
                    : null,
                body: Column(
                  children: [
                    /* Row(
                      children: [
                        BackButton(
                          onPressed: () {
                            if (isGroup) {
                              context.read<IsGroupCubit>().change();
                              return;
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(isGroup ? 'Nuevo grupo' : 'Personas'),
                      ],
                    ), */
                    if (!isGroup)
                      ElevatedButton(
                        onPressed: () =>
                            context.read<IsGroupCubit>().change(),
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
                            final user = selectedUsers[index];
                            return Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CircleAvatar(),
                                    Text(user.chatUser.name),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () => context
                                      .read<ChatSelectionCubit>()
                                      .selectUser(user),
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: chatsState.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final user = chatsState[index];
                          return ListTile(
                            onTap: () async{
                              if (!isGroup) {
                                final channel = await context
                                    .read<ChatSelectionCubit>()
                                    .createSingleChat(user);
                                // ignore: use_build_context_synchronously
                                pushReplacementPage(context, ChannelScreen(channel: channel,));
                              }
                            },
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(user.chatUser.image!),
                            ),
                            title: Text(user.chatUser.name),
                            trailing: isGroup
                                ? Checkbox(
                                    value: user.isSelected,
                                    onChanged: (value) => context
                                        .read<ChatSelectionCubit>()
                                        .selectUser(user),
                                  )
                                : null,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
