import 'package:flutter/material.dart';

import '../core/config/app_config.dart';
import '../core/theme/app_theme.dart';
import '../features/auth/presentation/pages/sign_in_page.dart';
import '../features/checkout/data/repositories/in_memory_checkout_repository.dart';
import '../features/checkout/domain/services/checkout_service.dart';
import '../features/checkout/presentation/controllers/checkout_controller.dart';
import '../features/checkout/presentation/pages/checkout_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import 'router/app_routes.dart';

class ZayahApp extends StatelessWidget {
  const ZayahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: AppRoutes.home,
      routes: <String, WidgetBuilder>{
        AppRoutes.home: (_) => const HomePage(),
        AppRoutes.signIn: (_) => const SignInPage(),
        AppRoutes.checkout: (_) {
          final repository = InMemoryCheckoutRepository();
          final service = CheckoutService(repository: repository);
          final controller = CheckoutController(service: service);
          return CheckoutPage(controller: controller);
        },
      },
      onUnknownRoute: (_) => MaterialPageRoute<void>(
        builder: (_) => const HomePage(),
      ),
    );
  }
}
