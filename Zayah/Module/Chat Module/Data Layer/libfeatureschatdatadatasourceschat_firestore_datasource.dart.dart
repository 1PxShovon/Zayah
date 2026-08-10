import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirestoreDataSource {
  final FirebaseFirestore firestore;

  const ChatFirestoreDataSource(
    this.firestore,
  );

  Stream<QuerySnapshot<Map<String, dynamic>>>
      getRooms(
    String userId,
  ) {
    return firestore
        .collection("chat_rooms")
        .where(
          "participants",
          arrayContains: userId,
        )
        .orderBy(
          "updatedAt",
          descending: true,
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
      getMessages(
    String roomId,
  ) {
    return firestore
        .collection("chat_rooms")
        .doc(roomId)
        .collection("messages")
        .orderBy("createdAt")
        .snapshots();
  }
}