import '../entities/booking.dart';

abstract class BookingRepository {
  Future<Booking> createBooking(Booking booking);

  Future<Booking> getBookingById(String bookingId);

  Future<List<Booking>> getUserBookings(
    String customerId,
  );

  Future<void> cancelBooking(
    String bookingId,
  );

  Future<void> updateBookingStatus({
    required String bookingId,
    required BookingStatus status,
  });
}