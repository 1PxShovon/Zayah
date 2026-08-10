import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  const SendMessageUseCase(this.repository);

  Future<void> call(
    ChatMessage message,
  ) {
    return repository.sendMessage(message);
  }
}