import 'checkout_item.dart';

class CheckoutSummary {
  const CheckoutSummary({
    required this.items,
    required this.serviceFee,
    required this.currency,
  });

  final List<CheckoutItem> items;
  final double serviceFee;
  final String currency;

  double get subtotal =>
      items.fold<double>(0, (sum, item) => sum + item.total);

  double get total => subtotal + serviceFee;

  bool get isEmpty => items.isEmpty;
}
