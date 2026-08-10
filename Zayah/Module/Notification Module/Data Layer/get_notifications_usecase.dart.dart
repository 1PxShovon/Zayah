import '../entities/app_notification.dart';
import '../repositories/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository repository;

  const GetNotificationsUseCase(
    this.repository,
  );

  Stream<List<AppNotification>> call(
    String userId,
  ) {
    return repository.getNotifications(
      userId,
    );
  }
}