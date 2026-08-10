import '../../domain/entities/service.dart';
import '../../domain/repositories/service_repository.dart';
import '../datasources/service_firestore_datasource.dart';
import '../models/service_model.dart';

class ServiceRepositoryImpl
    implements ServiceRepository {

  final ServiceFirestoreDataSource dataSource;

  const ServiceRepositoryImpl(
    this.dataSource,
  );

  @override
  Future<List<Service>> getServices({
    String? categoryId,
  }) async {

    final snapshot = await dataSource.getServices(
      categoryId: categoryId,
    );

    return snapshot.docs
        .map(
          (e) => ServiceModel.fromJson(
            e.data(),
          ),
        )
        .toList();
  }

  @override
  Future<Service> getServiceById(
    String id,
  ) async {

    final doc = await dataSource.getServiceById(id);

    return ServiceModel.fromJson(
      doc.data()!,
    );
  }
}