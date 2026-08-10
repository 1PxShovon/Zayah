import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationFirestoreDataSource {
  final FirebaseFirestore firestore;

  const NotificationFirestoreDataSource(
    this.firestore,
  );

  Stream<QuerySnapshot<Map<String, dynamic>>> getNotifications(
    String userId,
  ) {
    return firestore
        .collection("notifications")
        .where(
          "userId",
          isEqualTo: userId,
        )
        .orderBy(
          "createdAt",
          descending: true,
        )
        .snapshots();
  }

  Future<void> markAsRead(
    String notificationId,
  ) {
    return firestore
        .collection("notifications")
        .doc(notificationId)
        .update({
      "isRead": true,
    });
  }

  Future<void> markAllAsRead(
    String userId,
  ) async {
    final snapshot = await firestore
        .collection("notifications")
        .where(
          "userId",
          isEqualTo: userId,
        )
        .where(
          "isRead",
          isEqualTo: false,
        )
        .get();

    final batch = firestore.batch();

    for (final doc in snapshot.docs) {
      batch.update(
        doc.reference,
        {
          "isRead": true,
        },
      );
    }

    await batch.commit();
  }
}