import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/app_notification.dart';
import '../../domain/usecases/get_notifications_usecase.dart';

sealed class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<AppNotification> notifications;

  NotificationLoaded(this.notifications);
}

class NotificationError extends NotificationState {
  final String message;

  NotificationError(this.message);
}

class NotificationCubit
    extends Cubit<NotificationState> {

  final GetNotificationsUseCase
      getNotificationsUseCase;

  StreamSubscription? _subscription;

  NotificationCubit({
    required this.getNotificationsUseCase,
  }) : super(NotificationInitial());

  void loadNotifications(
    String userId,
  ) {
    emit(NotificationLoading());

    _subscription?.cancel();

    _subscription = getNotificationsUseCase(
      userId,
    ).listen(
      (data) {
        emit(NotificationLoaded(data));
      },
      onError: (e) {
        emit(
          NotificationError(
            e.toString(),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}