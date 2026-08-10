import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_firestore_datasource.dart';
import '../models/order_model.dart';

class OrderRepositoryImpl
    implements OrderRepository {

  final OrderFirestoreDataSource dataSource;

  const OrderRepositoryImpl(
    this.dataSource,
  );

  @override
  Future<List<Order>> getMyOrders({
    required String customerId,
  }) async {

    final snapshot =
        await dataSource.getOrders(customerId);

    return snapshot.docs
        .map(
          (e) =>
              OrderModel.fromJson(e.data()),
        )
        .toList();
  }

  @override
  Future<Order> getOrderById(
    String orderId,
  ) async {

    final doc =
        await dataSource.getOrder(orderId);

    return OrderModel.fromJson(
      doc.data()!,
    );
  }

  @override
  Future<void> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
  }) {
    return dataSource.updateStatus(
      orderId: orderId,
      status: status.name,
    );
  }

  @override
  Future<void> cancelOrder(
    String orderId,
  ) {
    return updateOrderStatus(
      orderId: orderId,
      status: OrderStatus.cancelled,
    );
  }
}