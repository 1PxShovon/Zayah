import '../../domain/entities/checkout_address.dart';
import '../../domain/entities/checkout_summary.dart';
import '../../domain/repositories/checkout_repository.dart';

class InMemoryCheckoutRepository implements CheckoutRepository {
  @override
  Future<String> createPendingOrder({
    required CheckoutSummary summary,
    required CheckoutAddress address,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return 'ZAY-${DateTime.now().millisecondsSinceEpoch}';
  }
}
