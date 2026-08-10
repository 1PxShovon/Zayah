import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/chat_room.dart';
import '../../domain/usecases/get_chat_rooms_usecase.dart';

sealed class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatRoom> rooms;

  ChatLoaded(this.rooms);
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);
}

class ChatCubit extends Cubit<ChatState> {
  final GetChatRoomsUseCase getChatRoomsUseCase;

  StreamSubscription? _subscription;

  ChatCubit({
    required this.getChatRoomsUseCase,
  }) : super(ChatInitial());

  void loadRooms(
    String userId,
  ) {
    emit(ChatLoading());

    _subscription?.cancel();

    _subscription = getChatRoomsUseCase(
      userId,
    ).listen(
      (rooms) {
        emit(ChatLoaded(rooms));
      },
      onError: (e) {
        emit(ChatError(e.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}