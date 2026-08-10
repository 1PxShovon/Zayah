import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/app_notification.dart';
import '../controllers/notification_cubit.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() =>
      _NotificationPageState();
}

class _NotificationPageState
    extends State<NotificationPage> {

  @override
  void initState() {
    super.initState();

    context
        .read<NotificationCubit>()
        .loadNotifications(
          "CURRENT_USER_ID",
        );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Notifications",
        ),

        actions: [

          TextButton(
            onPressed: () {
              // TODO:
              // Mark All Read
            },
            child: const Text(
              "Read All",
            ),
          ),

        ],
      ),

      body: BlocBuilder<
          NotificationCubit,
          NotificationState>(

        builder: (_, state) {

          if (state
              is NotificationLoading) {

            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          if (state
              is NotificationError) {

            return Center(
              child: Text(
                state.message,
              ),
            );
          }

          if (state
              is NotificationLoaded) {

            if (state
                .notifications
                .isEmpty) {

              return const Center(
                child: Text(
                  "No Notifications",
                ),
              );

            }

            return ListView.builder(

              itemCount: state
                  .notifications
                  .length,

              itemBuilder: (_, index) {

                final AppNotification item =
                    state.notifications[index];

                return Dismissible(

                  key: ValueKey(
                    item.id,
                  ),

                  background:
                      Container(
                    color: Colors.green,
                    alignment:
                        Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(
                      left: 20,
                    ),
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),

                  onDismissed: (_) {

                    // TODO:
                    // Mark As Read

                  },

                  child: ListTile(

                    leading: CircleAvatar(

                      backgroundColor:
                          item.isRead
                              ? Colors.grey
                              : Colors.blue,

                      child: const Icon(
                        Icons.notifications,
                        color:
                            Colors.white,
                      ),
                    ),

                    title: Text(
                      item.title,
                    ),

                    subtitle: Text(
                      item.body,
                    ),

                    trailing:
                        item.isRead
                            ? null
                            : Container(
                                width: 10,
                                height: 10,
                                decoration:
                                    const BoxDecoration(
                                  color:
                                      Colors.red,
                                  shape:
                                      BoxShape
                                          .circle,
                                ),
                              ),
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}