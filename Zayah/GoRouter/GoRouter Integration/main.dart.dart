Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(
    const ZayahApp(),
  );

}