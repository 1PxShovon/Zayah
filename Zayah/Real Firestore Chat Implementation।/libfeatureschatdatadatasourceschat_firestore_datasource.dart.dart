Future<void> sendMessage({
  required String roomId,
  required Map<String, dynamic> message,
}) async {
  final roomRef = firestore.collection("chat_rooms").doc(roomId);

  final messageRef = roomRef.collection("messages").doc();

  final batch = firestore.batch();

  batch.set(
    messageRef,
    {
      ...message,
      "id": messageRef.id,
      "createdAt": FieldValue.serverTimestamp(),
    },
  );

  batch.update(
    roomRef,
    {
      "lastMessage": message["message"],
      "updatedAt": FieldValue.serverTimestamp(),
    },
  );

  await batch.commit();
}