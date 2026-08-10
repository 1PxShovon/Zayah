# Zayah Flutter Web

This folder contains the Flutter Web platform bootstrap.

The actual website/application UI remains in `lib/`, shared with Android and iOS.

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

## Build production web

```bash
flutter build web --release
```

The compiled website will be created in:

```text
build/web/
```

Deploy the contents of `build/web/` to Firebase Hosting, Vercel, Netlify, or another static host.

## Important

The current package contains the website foundation and checkout flow. It is not yet the complete production website.
