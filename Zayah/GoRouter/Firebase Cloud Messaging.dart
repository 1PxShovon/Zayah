class NotificationService {

  Future<void> initialize() async {

    await FirebaseMessaging.instance
        .requestPermission();

    FirebaseMessaging.onMessage.listen(
      (message) {

        // Show Local Notification

      },
    );

  }

}