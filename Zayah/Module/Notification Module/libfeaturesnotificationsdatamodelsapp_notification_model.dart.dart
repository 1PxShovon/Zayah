import '../../domain/entities/app_notification.dart';

class AppNotificationModel extends AppNotification {
  const AppNotificationModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
    required super.type,
    required super.isRead,
    required super.createdAt,
  });

  factory AppNotificationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AppNotificationModel(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      body: json["body"],
      type: NotificationType.values.byName(json["type"]),
      isRead: json["isRead"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "body": body,
      "type": type.name,
      "isRead": isRead,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}