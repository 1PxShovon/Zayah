import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/booking_model.dart';

class BookingFirestoreDataSource {
  final FirebaseFirestore firestore;

  const BookingFirestoreDataSource(
    this.firestore,
  );

  Future<void> createBooking(
    BookingModel booking,
  ) async {
    await firestore
        .collection("bookings")
        .doc(booking.id)
        .set(
          booking.toJson(),
        );
  }

  Future<DocumentSnapshot<Map<String, dynamic>>>
      getBooking(
    String bookingId,
  ) {
    return firestore
        .collection("bookings")
        .doc(bookingId)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>>
      getCustomerBookings(
    String customerId,
  ) {
    return firestore
        .collection("bookings")
        .where(
          "customerId",
          isEqualTo: customerId,
        )
        .orderBy(
          "createdAt",
          descending: true,
        )
        .get();
  }

  Future<void> updateStatus({
    required String bookingId,
    required String status,
  }) {
    return firestore
        .collection("bookings")
        .doc(bookingId)
        .update({
      "status": status,
      "updatedAt":
          FieldValue.serverTimestamp(),
    });
  }
}