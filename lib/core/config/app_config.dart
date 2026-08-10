abstract final class AppConfig {
  static const String appName = 'Zayah';
  static const String market = 'Kuwait';
  static const String defaultCurrency = 'KWD';
  static const String environment = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'development',
  );
}
