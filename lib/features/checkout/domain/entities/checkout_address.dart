class CheckoutAddress {
  const CheckoutAddress({
    required this.area,
    required this.block,
    required this.street,
    required this.building,
    this.floor,
    this.notes,
  });

  final String area;
  final String block;
  final String street;
  final String building;
  final String? floor;
  final String? notes;

  bool get isValid =>
      area.trim().isNotEmpty &&
      block.trim().isNotEmpty &&
      street.trim().isNotEmpty &&
      building.trim().isNotEmpty;
}
