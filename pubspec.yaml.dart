name: zayah
description: Zayah - Kuwait Service Marketplace
publish_to: "none"

version: 1.0.0+1

environment:
  sdk: ">=3.9.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8

  # Firebase
  firebase_core: ^3.15.2
  firebase_auth: ^5.6.2
  cloud_firestore: ^5.6.11
  firebase_storage: ^12.4.9
  firebase_messaging: ^15.2.10

  # State Management
  flutter_bloc: ^9.1.1
  equatable: ^2.0.7

  # Dependency Injection
  get_it: ^8.0.3

  # Navigation
  go_router: ^16.0.0

  # Authentication
  google_sign_in: ^6.3.0
  sign_in_with_apple: ^7.0.1

  # Networking
  http: ^1.6.0

  # Secure Storage
  flutter_secure_storage: ^9.2.4

  # Local Storage
  shared_preferences: ^2.5.3

  # Connectivity / Offline
  connectivity_plus: ^6.1.5

  # Images
  image_picker: ^1.2.1
  cached_network_image: ^3.4.1

  # Notifications
  flutter_local_notifications: ^19.4.0

  # Web / Payment Foundation
  webview_flutter: ^4.13.0
  url_launcher: ^6.3.2

  # Localization / Date / Currency
  intl: ^0.20.2

  # UI
  google_fonts: ^6.3.3

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^5.0.0

  bloc_test: ^10.0.0
  mocktail: ^1.0.4

flutter:
  uses-material-design: true