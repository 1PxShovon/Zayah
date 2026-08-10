import '../../domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  const ChatMessageModel({
    required super.id,
    required super.roomId,
    required super.senderId,
    required super.message,
    required super.type,
    required super.isRead,
    required super.createdAt,
  });

  factory ChatMessageModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ChatMessageModel(
      id: json["id"],
      roomId: json["roomId"],
      senderId: json["senderId"],
      message: json["message"],
      type: MessageType.values.byName(json["type"]),
      isRead: json["isRead"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "roomId": roomId,
      "senderId": senderId,
      "message": message,
      "type": type.name,
      "isRead": isRead,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}