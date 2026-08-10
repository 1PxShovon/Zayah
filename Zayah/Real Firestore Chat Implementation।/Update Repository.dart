@override
Future<void> sendMessage(
  ChatMessage message,
) {
  return dataSource.sendMessage(
    roomId: message.roomId,
    message: ChatMessageModel(
      id: message.id,
      roomId: message.roomId,
      senderId: message.senderId,
      message: message.message,
      type: message.type,
      isRead: message.isRead,
      createdAt: message.createdAt,
    ).toJson(),
  );
}

@override
Future<void> markMessagesAsRead(
  String roomId,
) {
  return dataSource.markMessagesAsRead(
    roomId,
  );
}