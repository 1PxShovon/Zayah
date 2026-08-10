extension AuthExtension on AuthService {

  String requireUserId() {

    final id = currentUserId;

    if (id == null) {
      throw Exception(
        "User not authenticated.",
      );
    }

    return id;
  }

}