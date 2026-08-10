import '../entities/service.dart';
import '../repositories/service_repository.dart';

class GetServicesUseCase {
  final ServiceRepository repository;

  const GetServicesUseCase(
    this.repository,
  );

  Future<List<Service>> call({
    String? categoryId,
  }) {
    return repository.getServices(
      categoryId: categoryId,
    );
  }
}