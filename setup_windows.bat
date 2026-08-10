@echo off
setlocal

echo ==========================================
echo Zayah Flutter Project Setup
echo ==========================================

where flutter >nul 2>&1
if errorlevel 1 (
  echo ERROR: Flutter was not found in PATH.
  echo Install Flutter SDK, then run this file again.
  pause
  exit /b 1
)

flutter create --platforms=android,ios,web .
if errorlevel 1 goto :error

flutter pub get
if errorlevel 1 goto :error

flutter analyze
if errorlevel 1 goto :error

flutter test
if errorlevel 1 goto :error

echo.
echo Setup completed successfully.
echo Run: flutter run
pause
exit /b 0

:error
echo.
echo Setup failed. Review the error above.
pause
exit /b 1
