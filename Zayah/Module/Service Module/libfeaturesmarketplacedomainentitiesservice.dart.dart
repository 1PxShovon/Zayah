import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final String id;
  final String title;
  final String description;
  final String categoryId;
  final String providerId;

  final double price;
  final String currency;

  final List<String> images;

  final double rating;
  final int reviewCount;

  final bool isAvailable;
  final bool isFeatured;

  final DateTime createdAt;
  final DateTime updatedAt;

  const Service({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.providerId,
    required this.price,
    required this.currency,
    required this.images,
    required this.rating,
    required this.reviewCount,
    required this.isAvailable,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        categoryId,
        providerId,
        price,
        currency,
        images,
        rating,
        reviewCount,
        isAvailable,
        isFeatured,
        createdAt,
        updatedAt,
      ];
}