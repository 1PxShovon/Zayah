class ZayahApp extends StatelessWidget {
  const ZayahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Zayah',
      routerConfig: AppRouter.router,
      theme: AppTheme.light,
    );
  }
}