import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/orders/presentation/pages/my_orders_page.dart';
import '../../features/notifications/presentation/pages/notification_page.dart';
import '../../features/chat/presentation/pages/chat_list_page.dart';

final appRouter = GoRouter(
  initialLocation: "/",

  routes: [

    GoRoute(
      path: "/",
      builder: (_, __) => const LoginPage(),
    ),

    GoRoute(
      path: "/register",
      builder: (_, __) => const RegisterPage(),
    ),

    GoRoute(
      path: "/home",
      builder: (_, __) => const HomePage(),
    ),

    GoRoute(
      path: "/orders",
      builder: (_, __) => const MyOrdersPage(),
    ),

    GoRoute(
      path: "/notifications",
      builder: (_, __) => const NotificationPage(),
    ),

    GoRoute(
      path: "/chat",
      builder: (_, __) => const ChatListPage(),
    ),
  ],
);