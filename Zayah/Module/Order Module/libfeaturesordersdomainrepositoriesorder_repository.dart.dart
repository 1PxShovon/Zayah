import '../entities/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getMyOrders({
    required String customerId,
  });

  Future<Order> getOrderById(
    String orderId,
  );

  Future<void> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
  });

  Future<void> cancelOrder(
    String orderId,
  );
}