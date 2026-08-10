# Zayah Flutter Base Project

Production-first Flutter foundation for **Zayah**, a Kuwait-focused service marketplace.

## Included

- Modular feature-first folder structure
- Material 3 theme
- Named-route navigation
- Authentication placeholder flow
- Marketplace home foundation
- Production checkout domain model and controller foundation
- Order model foundation
- Tests, documentation, setup scripts, and backup manifest

## First-time setup on Windows

1. Install Flutter SDK and Android Studio.
2. Extract this ZIP.
3. Open the extracted `Zayah_Flutter_Base_Project` folder.
4. Double-click `setup_windows.bat`, or run:

```powershell
flutter create --platforms=android,ios,web .
flutter pub get
flutter analyze
flutter test
flutter run
```

> iOS builds require macOS and Xcode. The same source code can still be stored and edited on Windows.

## First-time setup on macOS/Linux

```bash
chmod +x setup_linux_macos.sh
./setup_linux_macos.sh
flutter run
```

## Production implementation order

1. Firebase environments and authentication
2. User roles and authorization
3. Marketplace and service catalogue
4. Cart and checkout
5. Order lifecycle
6. KNET payment backend integration
7. Notifications
8. Admin/provider dashboards
9. Security tests and release pipeline

## Security note

Never commit live Firebase configuration, KNET credentials, signing keys, or production secrets.

## Website / Flutter Web

This version includes the `web/` platform folder.

Run the website in Chrome:

```bash
flutter pub get
flutter run -d chrome
```

Create a deployable production website:

```bash
flutter build web --release
```

The deployable output will be available in `build/web/`.
