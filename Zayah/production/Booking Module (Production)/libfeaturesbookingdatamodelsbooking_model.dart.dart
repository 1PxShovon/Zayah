import '../../domain/entities/booking.dart';

class BookingModel extends Booking {
  const BookingModel({
    required super.id,
    required super.customerId,
    required super.providerId,
    required super.serviceId,
    required super.addressId,
    required super.bookingDate,
    required super.timeSlot,
    required super.serviceAmount,
    required super.vatAmount,
    required super.discountAmount,
    required super.totalAmount,
    required super.status,
    super.notes,
    required super.createdAt,
    required super.updatedAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      customerId: json['customerId'],
      providerId: json['providerId'],
      serviceId: json['serviceId'],
      addressId: json['addressId'],
      bookingDate: DateTime.parse(json['bookingDate']),
      timeSlot: json['timeSlot'],
      serviceAmount: (json['serviceAmount'] as num).toDouble(),
      vatAmount: (json['vatAmount'] as num).toDouble(),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: BookingStatus.values.byName(json['status']),
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'customerId': customerId,
        'providerId': providerId,
        'serviceId': serviceId,
        'addressId': addressId,
        'bookingDate': bookingDate.toIso8601String(),
        'timeSlot': timeSlot,
        'serviceAmount': serviceAmount,
        'vatAmount': vatAmount,
        'discountAmount': discountAmount,
        'totalAmount': totalAmount,
        'status': status.name,
        'notes': notes,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}