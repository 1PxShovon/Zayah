Future<void> markMessagesAsRead(
  String roomId,
) async {
  final snapshot = await firestore
      .collection("chat_rooms")
      .doc(roomId)
      .collection("messages")
      .where("isRead", isEqualTo: false)
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