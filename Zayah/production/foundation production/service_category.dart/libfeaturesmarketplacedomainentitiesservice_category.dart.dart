import 'package:equatable/equatable.dart';

class ServiceCategory extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String icon;
  final bool isActive;
  final int sortOrder;

  const ServiceCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.icon,
    required this.isActive,
    required this.sortOrder,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        icon,
        isActive,
        sortOrder,
      ];
}