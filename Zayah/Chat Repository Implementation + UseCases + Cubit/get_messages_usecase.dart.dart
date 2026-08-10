import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class GetMessagesUseCase {
  final ChatRepository repository;

  const GetMessagesUseCase(this.repository);

  Stream<List<ChatMessage>> call(
    String roomId,
  ) {
    return repository.getMessages(roomId);
  }
}