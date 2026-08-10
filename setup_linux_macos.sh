#!/usr/bin/env bash
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  echo "ERROR: Flutter was not found in PATH."
  exit 1
fi

flutter create --platforms=android,ios,web .
flutter pub get
flutter analyze
flutter test

echo "Setup completed. Run: flutter run"
