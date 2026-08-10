import 'package:cloud_firestore/cloud_firestore.dart';

class OrderFirestoreDataSource {
  final FirebaseFirestore firestore;

  const OrderFirestoreDataSource(
    this.firestore,
  );

  Future<QuerySnapshot<Map<String, dynamic>>>
      getOrders(
    String customerId,
  ) {
    return firestore
        .collection("orders")
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

  Future<DocumentSnapshot<Map<String, dynamic>>>
      getOrder(
    String orderId,
  ) {
    return firestore
        .collection("orders")
        .doc(orderId)
        .get();
  }

  Future<void> updateStatus({
    required String orderId,
    required String status,
  }) {
    return firestore
        .collection("orders")
        .doc(orderId)
        .update({
      "status": status,
      "updatedAt": FieldValue.serverTimestamp(),
    });
  }
}