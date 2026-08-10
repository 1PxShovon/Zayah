import '../entities/chat_room.dart';
import '../entities/chat_message.dart';

abstract class ChatRepository {
  Stream<List<ChatRoom>> getChatRooms(
    String userId,
  );

  Stream<List<ChatMessage>> getMessages(
    String roomId,
  );

  Future<void> sendMessage(
    ChatMessage message,
  );

  Future<void> markMessagesAsRead(
    String roomId,
  );
}