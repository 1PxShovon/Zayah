import '../../domain/entities/service_category.dart';
import '../../domain/repositories/service_repository.dart';
import '../datasources/marketplace_firestore_datasource.dart';
import '../models/service_category_model.dart';

class ServiceRepositoryImpl
    implements ServiceRepository {

  final MarketplaceFirestoreDataSource dataSource;

  ServiceRepositoryImpl(this.dataSource);

  @override
  Future<List<ServiceCategory>> getCategories() async {

    final snapshot = await dataSource.getCategories();

    return snapshot.docs
        .map(
          (doc) => ServiceCategoryModel.fromJson(
            doc.data(),
          ),
        )
        .toList();
  }

  @override
  Future<List<ServiceCategory>> searchCategories(
    String keyword,
  ) async {

    final list = await getCategories();

    return list
        .where(
          (e) => e.name
              .toLowerCase()
              .contains(
                keyword.toLowerCase(),
              ),
        )
        .toList();
  }
}