import 'package:chat_app/data/implementations/auth_repository_impl.dart';
import 'package:chat_app/data/implementations/image_picker_repository_impl.dart';
import 'package:chat_app/data/implementations/local_storage_repository_impl.dart';
import 'package:chat_app/data/implementations/stream_api_repository_impl.dart';
import 'package:chat_app/data/implementations/upload_storage_repository_impl.dart';
import 'package:chat_app/domain/repositories/auth_repository.dart';
import 'package:chat_app/domain/repositories/image_picker_repository.dart';
import 'package:chat_app/domain/repositories/local_storage_repository.dart';
import 'package:chat_app/domain/repositories/stream_api_repository.dart';
import 'package:chat_app/domain/repositories/upload_storage_repository.dart';
import 'package:chat_app/domain/use_cases/create_group_use_case.dart';
import 'package:chat_app/domain/use_cases/login_use_case.dart';
import 'package:chat_app/domain/use_cases/logout_use_case.dart';
import 'package:chat_app/domain/use_cases/profile_sign_in_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

List<RepositoryProvider> buildRepositories(StreamChatClient client) {
  return [
    RepositoryProvider<StreamApiRepository>(create: (_) => StreamApiRepositoryImpl(client: client)),
    RepositoryProvider<LocalStorageRepository>(create: (_) => LocalStorageRepositoryImpl()),
    RepositoryProvider<AuthRepository>(create: (_) => AuthRepositoryImpl()),
    RepositoryProvider<UploadStorageRepository>(create: (_) => UploadStorageRepositoryImpl()),
    RepositoryProvider<ImagePickerRepository>(create: (_) => ImagePickerRepositoryImpl()),
    RepositoryProvider<ProfileSignInUseCase>(create: (context) => ProfileSignInUseCase(
      authRepository: context.read(), 
      streamApiRepository: context.read(), 
      uploadStorageRepository: context.read(),
    ),),
    RepositoryProvider<LoginUseCase>(create: (context) => LoginUseCase(
      authRepository: context.read(), 
      streamApiRepository: context.read(),
    ),),
    RepositoryProvider<LogoutUseCase>(create: (context) => LogoutUseCase(
      authRepository: context.read(), 
      streamApiRepository: context.read(),
    ),),
    RepositoryProvider<CreateGroupUseCase>(create: (context) => CreateGroupUseCase(
      streamApiRepository: context.read(), 
      uploadStorageRepository: context.read(),
    ),),
  ];
}
