import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';

import '../datasources/booking_firestore_datasource.dart';
import '../models/booking_model.dart';

class BookingRepositoryImpl
    implements BookingRepository {

  final BookingFirestoreDataSource dataSource;

  const BookingRepositoryImpl(
    this.dataSource,
  );

  @override
  Future<Booking> createBooking(
    Booking booking,
  ) async {

    final model = BookingModel(
      id: booking.id,
      customerId: booking.customerId,
      providerId: booking.providerId,
      serviceId: booking.serviceId,
      addressId: booking.addressId,
      bookingDate: booking.bookingDate,
      timeSlot: booking.timeSlot,
      serviceAmount: booking.serviceAmount,
      vatAmount: booking.vatAmount,
      discountAmount: booking.discountAmount,
      totalAmount: booking.totalAmount,
      status: booking.status,
      notes: booking.notes,
      createdAt: booking.createdAt,
      updatedAt: booking.updatedAt,
    );

    await dataSource.createBooking(model);

    return booking;
  }

  @override
  Future<Booking> getBookingById(
    String bookingId,
  ) async {
    final doc =
        await dataSource.getBooking(bookingId);

    return BookingModel.fromJson(
      doc.data()!,
    );
  }

  @override
  Future<List<Booking>> getUserBookings(
    String customerId,
  ) async {

    final snapshot =
        await dataSource.getCustomerBookings(
      customerId,
    );

    return snapshot.docs
        .map(
          (e) =>
              BookingModel.fromJson(e.data()),
        )
        .toList();
  }

  @override
  Future<void> cancelBooking(
    String bookingId,
  ) {
    return dataSource.updateStatus(
      bookingId: bookingId,
      status: BookingStatus.cancelled.name,
    );
  }

  @override
  Future<void> updateBookingStatus({
    required String bookingId,
    required BookingStatus status,
  }) {
    return dataSource.updateStatus(
      bookingId: bookingId,
      status: status.name,
    );
  }
}