import 'package:equatable/equatable.dart';

class ChatRoom extends Equatable {
  final String id;
  final String bookingId;
  final String customerId;
  final String providerId;
  final String? technicianId;

  final DateTime createdAt;
  final DateTime updatedAt;

  final String lastMessage;
  final bool customerUnread;
  final bool providerUnread;

  const ChatRoom({
    required this.id,
    required this.bookingId,
    required this.customerId,
    required this.providerId,
    this.technicianId,
    required this.createdAt,
    required this.updatedAt,
    required this.lastMessage,
    required this.customerUnread,
    required this.providerUnread,
  });

  @override
  List<Object?> get props => [
        id,
        bookingId,
        customerId,
        providerId,
        technicianId,
        createdAt,
        updatedAt,
        lastMessage,
        customerUnread,
        providerUnread,
      ];
}