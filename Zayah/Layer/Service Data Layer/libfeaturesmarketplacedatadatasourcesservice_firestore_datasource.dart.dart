import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceFirestoreDataSource {
  final FirebaseFirestore firestore;

  const ServiceFirestoreDataSource(this.firestore);

  Future<QuerySnapshot<Map<String, dynamic>>> getServices({
    String? categoryId,
  }) {
    Query<Map<String, dynamic>> query = firestore
        .collection('services')
        .where('isAvailable', isEqualTo: true);

    if (categoryId != null && categoryId.isNotEmpty) {
      query = query.where('categoryId', isEqualTo: categoryId);
    }

    return query.orderBy('createdAt', descending: true).get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getServiceById(
    String id,
  ) {
    return firestore.collection('services').doc(id).get();
  }
}