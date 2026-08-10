import 'package:equatable/equatable.dart';

enum BookingStatus {
  pending,
  confirmed,
  assigned,
  onTheWay,
  inProgress,
  completed,
  cancelled,
}

class Booking extends Equatable {
  final String id;
  final String customerId;
  final String providerId;
  final String serviceId;
  final String addressId;

  final DateTime bookingDate;
  final String timeSlot;

  final double serviceAmount;
  final double vatAmount;
  final double discountAmount;
  final double totalAmount;

  final BookingStatus status;

  final String? notes;

  final DateTime createdAt;
  final DateTime updatedAt;

  const Booking({
    required this.id,
    required this.customerId,
    required this.providerId,
    required this.serviceId,
    required this.addressId,
    required this.bookingDate,
    required this.timeSlot,
    required this.serviceAmount,
    required this.vatAmount,
    required this.discountAmount,
    required this.totalAmount,
    required this.status,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        customerId,
        providerId,
        serviceId,
        addressId,
        bookingDate,
        timeSlot,
        serviceAmount,
        vatAmount,
        discountAmount,
        totalAmount,
        status,
        notes,
        createdAt,
        updatedAt,
      ];
}