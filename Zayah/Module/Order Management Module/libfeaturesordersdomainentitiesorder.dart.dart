import 'package:equatable/equatable.dart';

enum OrderStatus {
  pending,
  confirmed,
  technicianAssigned,
  onTheWay,
  arrived,
  inProgress,
  completed,
  cancelled,
  refunded,
}

class Order extends Equatable {
  final String id;
  final String bookingId;
  final String customerId;
  final String providerId;
  final String technicianId;

  final OrderStatus status;

  final DateTime createdAt;
  final DateTime updatedAt;

  const Order({
    required this.id,
    required this.bookingId,
    required this.customerId,
    required this.providerId,
    required this.technicianId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        bookingId,
        customerId,
        providerId,
        technicianId,
        status,
        createdAt,
        updatedAt,
      ];
}