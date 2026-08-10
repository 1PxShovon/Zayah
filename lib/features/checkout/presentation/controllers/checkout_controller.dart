import 'package:flutter/foundation.dart';

import '../../../../core/errors/app_failure.dart';
import '../../domain/entities/checkout_address.dart';
import '../../domain/entities/checkout_item.dart';
import '../../domain/entities/checkout_summary.dart';
import '../../domain/services/checkout_service.dart';

class CheckoutController extends ChangeNotifier {
  CheckoutController({required CheckoutService service}) : _service = service;

  final CheckoutService _service;

  CheckoutSummary summary = const CheckoutSummary(
    items: <CheckoutItem>[
      CheckoutItem(
        id: 'service-ac-inspection',
        name: 'AC inspection',
        unitPrice: 15,
      ),
    ],
    serviceFee: 1.5,
    currency: 'KWD',
  );

  bool isSubmitting = false;
  String? errorMessage;
  String? pendingOrderId;

  Future<bool> submit(CheckoutAddress address) async {
    if (isSubmitting) {
      return false;
    }

    isSubmitting = true;
    errorMessage = null;
    notifyListeners();

    try {
      pendingOrderId = await _service.submit(
        summary: summary,
        address: address,
      );
      return true;
    } on AppFailure catch (error) {
      errorMessage = error.message;
      return false;
    } catch (_) {
      errorMessage = 'Something went wrong. Please try again.';
      return false;
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }
}
