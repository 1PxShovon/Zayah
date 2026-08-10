import '../../domain/entities/app_notification.dart';
import '../../domain/repositories/notification_repository.dart';

import '../datasources/notification_firestore_datasource.dart';
import '../models/app_notification_model.dart';

class NotificationRepositoryImpl
    implements NotificationRepository {

  final NotificationFirestoreDataSource dataSource;

  const NotificationRepositoryImpl(
    this.dataSource,
  );

  @override
  Stream<List<AppNotification>>
      getNotifications(
    String userId,
  ) {
    return dataSource
        .getNotifications(userId)
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => AppNotificationModel.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }

  @override
  Future<void> markAsRead(
    String notificationId,
  ) {
    return dataSource.markAsRead(
      notificationId,
    );
  }

  @override
  Future<void> markAllAsRead(
    String userId,
  ) {
    return dataSource.markAllAsRead(
      userId,
    );
  }
}