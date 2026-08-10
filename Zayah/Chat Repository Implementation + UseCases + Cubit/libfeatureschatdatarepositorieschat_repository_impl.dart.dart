import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_room.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_firestore_datasource.dart';
import '../models/chat_message_model.dart';
import '../models/chat_room_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatFirestoreDataSource dataSource;

  const ChatRepositoryImpl(this.dataSource);

  @override
  Stream<List<ChatRoom>> getChatRooms(String userId) {
    return dataSource.getRooms(userId).map(
          (snapshot) => snapshot.docs
              .map((e) => ChatRoomModel.fromJson(e.data()))
              .toList(),
        );
  }

  @override
  Stream<List<ChatMessage>> getMessages(String roomId) {
    return dataSource.getMessages(roomId).map(
          (snapshot) => snapshot.docs
              .map((e) => ChatMessageModel.fromJson(e.data()))
              .toList(),
        );
  }

  @override
  Future<void> sendMessage(ChatMessage message) {
    // TODO:
    // Firestore implementation
    throw UnimplementedError();
  }

  @override
  Future<void> markMessagesAsRead(String roomId) {
    // TODO:
    // Firestore implementation
    throw UnimplementedError();
  }
}