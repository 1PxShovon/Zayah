import '../entities/service_category.dart';

abstract class ServiceRepository {
  /// Get all active categories
  Future<List<ServiceCategory>> getCategories();

  /// Search categories
  Future<List<ServiceCategory>> searchCategories(
    String keyword,
  );
}