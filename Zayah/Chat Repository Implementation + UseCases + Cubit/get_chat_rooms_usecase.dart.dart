import '../entities/chat_room.dart';
import '../repositories/chat_repository.dart';

class GetChatRoomsUseCase {
  final ChatRepository repository;

  const GetChatRoomsUseCase(this.repository);

  Stream<List<ChatRoom>> call(
    String userId,
  ) {
    return repository.getChatRooms(userId);
  }
}