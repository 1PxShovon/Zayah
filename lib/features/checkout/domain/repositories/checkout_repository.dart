import '../entities/checkout_address.dart';
import '../entities/checkout_summary.dart';

abstract interface class CheckoutRepository {
  Future<String> createPendingOrder({
    required CheckoutSummary summary,
    required CheckoutAddress address,
  });
}
