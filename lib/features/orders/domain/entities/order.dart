enum ZayahOrderStatus {
  pendingPayment,
  confirmed,
  assigned,
  accepted,
  inProgress,
  completed,
  cancelled,
}

class ZayahOrder {
  const ZayahOrder({
    required this.id,
    required this.customerId,
    required this.total,
    required this.currency,
    required this.status,
    required this.createdAt,
  });

  final String id;
  final String customerId;
  final double total;
  final String currency;
  final ZayahOrderStatus status;
  final DateTime createdAt;
}
