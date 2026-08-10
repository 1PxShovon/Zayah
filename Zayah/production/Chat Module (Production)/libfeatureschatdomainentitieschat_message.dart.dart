import 'package:equatable/equatable.dart';

enum MessageType {
  text,
  image,
  file,
  system,
}

class ChatMessage extends Equatable {
  final String id;
  final String roomId;
  final String senderId;

  final String message;

  final MessageType type;

  final bool isRead;

  final DateTime createdAt;

  const ChatMessage({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.message,
    required this.type,
    required this.isRead,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        roomId,
        senderId,
        message,
        type,
        isRead,
        createdAt,
      ];
}