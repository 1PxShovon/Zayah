import '../entities/user_entity.dart';

abstract class AuthRepository {
  /// Currently signed-in user
  Future<UserEntity?> getCurrentUser();

  /// Login with email & password
  Future<UserEntity> signInWithEmail({
    required String email,
    required String password,
  });

  /// Register new account
  Future<UserEntity> registerWithEmail({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  });

  /// Google authentication
  Future<UserEntity> signInWithGoogle();

  /// Apple authentication
  Future<UserEntity> signInWithApple();

  /// Send password reset email
  Future<void> sendPasswordResetEmail({
    required String email,
  });

  /// Send email verification
  Future<void> sendEmailVerification();

  /// Logout
  Future<void> signOut();

  /// Authentication state changes
  Stream<UserEntity?> authStateChanges();
}