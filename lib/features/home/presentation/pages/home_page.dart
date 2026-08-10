import 'package:flutter/material.dart';

import '../../../../app/router/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zayah'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.signIn),
            child: const Text('Sign in'),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Text(
              'Trusted services in Kuwait',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Production-first Flutter foundation for the Zayah marketplace.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            const _ModuleCard(
              title: 'Marketplace',
              subtitle: 'Service discovery and provider listings',
              icon: Icons.storefront_outlined,
            ),
            const SizedBox(height: 12),
            const _ModuleCard(
              title: 'Orders',
              subtitle: 'Booking and order lifecycle foundation',
              icon: Icons.receipt_long_outlined,
            ),
            const SizedBox(height: 12),
            _ModuleCard(
              title: 'Checkout',
              subtitle: 'Open the initial production checkout flow',
              icon: Icons.payment_outlined,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.checkout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  const _ModuleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: onTap == null
            ? const Icon(Icons.lock_outline)
            : const Icon(Icons.chevron_right),
      ),
    );
  }
}
