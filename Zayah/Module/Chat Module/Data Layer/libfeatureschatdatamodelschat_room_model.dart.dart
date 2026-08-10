import '../../domain/entities/chat_room.dart';

class ChatRoomModel extends ChatRoom {
  const ChatRoomModel({
    required super.id,
    required super.bookingId,
    required super.customerId,
    required super.providerId,
    super.technicianId,
    required super.createdAt,
    required super.updatedAt,
    required super.lastMessage,
    required super.customerUnread,
    required super.providerUnread,
  });

  factory ChatRoomModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ChatRoomModel(
      id: json["id"],
      bookingId: json["bookingId"],
      customerId: json["customerId"],
      providerId: json["providerId"],
      technicianId: json["technicianId"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      lastMessage: json["lastMessage"],
      customerUnread: json["customerUnread"],
      providerUnread: json["providerUnread"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "bookingId": bookingId,
      "customerId": customerId,
      "providerId": providerId,
      "technicianId": technicianId,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "lastMessage": lastMessage,
      "customerUnread": customerUnread,
      "providerUnread": providerUnread,
    };
  }
}