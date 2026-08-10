import '../../../../core/errors/app_failure.dart';
import '../entities/checkout_address.dart';
import '../entities/checkout_summary.dart';
import '../repositories/checkout_repository.dart';

class CheckoutService {
  const CheckoutService({required CheckoutRepository repository})
      : _repository = repository;

  final CheckoutRepository _repository;

  Future<String> submit({
    required CheckoutSummary summary,
    required CheckoutAddress address,
  }) async {
    if (summary.isEmpty) {
      throw const AppFailure('Your cart is empty.', code: 'empty-cart');
    }
    if (!address.isValid) {
      throw const AppFailure(
        'Complete all required address fields.',
        code: 'invalid-address',
      );
    }
    if (summary.total <= 0) {
      throw const AppFailure(
        'The checkout total must be greater than zero.',
        code: 'invalid-total',
      );
    }

    return _repository.createPendingOrder(
      summary: summary,
      address: address,
    );
  }
}
