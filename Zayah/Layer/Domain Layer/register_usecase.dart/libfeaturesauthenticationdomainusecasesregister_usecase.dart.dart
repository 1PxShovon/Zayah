import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  const RegisterUseCase(this.repository);

  Future<UserEntity> call({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) {
    return repository.registerWithEmail(
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
  }
}