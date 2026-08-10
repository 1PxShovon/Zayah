import 'package:cloud_firestore/cloud_firestore.dart';

class MarketplaceFirestoreDataSource {
  final FirebaseFirestore firestore;

  MarketplaceFirestoreDataSource(this.firestore);

  Future<QuerySnapshot<Map<String, dynamic>>> getCategories() {
    return firestore
        .collection('service_categories')
        .where('isActive', isEqualTo: true)
        .orderBy('sortOrder')
        .get();
  }
}