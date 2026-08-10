import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/firebase_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = dataSource.currentUser;

    if (user == null) return null;

    return UserEntity(
      id: user.uid,
      fullName: user.displayName ?? '',
      email: user.email ?? '',
      phoneNumber: user.phoneNumber ?? '',
      profileImageUrl: user.photoURL,
      role: UserRole.customer,
      emailVerified: user.emailVerified,
      phoneVerified: user.phoneNumber != null,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Stream<UserEntity?> authStateChanges() {
    return dataSource.authStateChanges().map((user) {
      if (user == null) return null;

      return UserEntity(
        id: user.uid,
        fullName: user.displayName ?? '',
        email: user.email ?? '',
        phoneNumber: user.phoneNumber ?? '',
        profileImageUrl: user.photoURL,
        role: UserRole.customer,
        emailVerified: user.emailVerified,
        phoneVerified: user.phoneNumber != null,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    });
  }

  @override
  Future<UserEntity> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final credential = await dataSource.signInWithEmail(
      email: email,
      password: password,
    );

    final user = credential.user!;

    return UserEntity(
      id: user.uid,
      fullName: user.displayName ?? '',
      email: user.email ?? '',
      phoneNumber: user.phoneNumber ?? '',
      profileImageUrl: user.photoURL,
      role: UserRole.customer,
      emailVerified: user.emailVerified,
      phoneVerified: user.phoneNumber != null,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<UserEntity> registerWithEmail({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final credential = await dataSource.registerWithEmail(
      email: email,
      password: password,
    );

    await dataSource.sendEmailVerification();

    final user = credential.user!;

    return UserEntity(
      id: user.uid,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      profileImageUrl: null,
      role: UserRole.customer,
      emailVerified: false,
      phoneVerified: false,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<void> sendPasswordResetEmail({
    required String email,
  }) {
    return dataSource.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> sendEmailVerification() {
    return dataSource.sendEmailVerification();
  }

  @override
  Future<void> signOut() {
    return dataSource.signOut();
  }

  @override
  Future<UserEntity> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signInWithApple() {
    throw UnimplementedError();
  }
}