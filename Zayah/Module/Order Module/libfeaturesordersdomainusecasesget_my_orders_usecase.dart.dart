import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetMyOrdersUseCase {
  final OrderRepository repository;

  const GetMyOrdersUseCase(
    this.repository,
  );

  Future<List<Order>> call({
    required String customerId,
  }) {
    return repository.getMyOrders(
      customerId: customerId,
    );
  }
}