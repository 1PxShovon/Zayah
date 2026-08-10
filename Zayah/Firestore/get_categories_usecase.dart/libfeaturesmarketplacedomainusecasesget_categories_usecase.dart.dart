import '../entities/service_category.dart';
import '../repositories/service_repository.dart';

class GetCategoriesUseCase {

  final ServiceRepository repository;

  const GetCategoriesUseCase(
    this.repository,
  );

  Future<List<ServiceCategory>> call() {
    return repository.getCategories();
  }
}