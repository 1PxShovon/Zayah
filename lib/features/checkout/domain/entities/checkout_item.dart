class CheckoutItem {
  const CheckoutItem({
    required this.id,
    required this.name,
    required this.unitPrice,
    this.quantity = 1,
  }) : assert(quantity > 0);

  final String id;
  final String name;
  final double unitPrice;
  final int quantity;

  double get total => unitPrice * quantity;
}
