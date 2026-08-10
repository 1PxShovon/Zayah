import '../entities/service.dart';

abstract class ServiceRepository {
  Future<List<Service>> getServices({
    String? categoryId,
  });

  Future<Service> getServiceById(
    String id,
  );
}