import '../../domain/entities/service.dart';

class ServiceModel extends Service {
  const ServiceModel({
    required super.id,
    required super.title,
    required super.description,
    required super.categoryId,
    required super.providerId,
    required super.price,
    required super.currency,
    required super.images,
    required super.rating,
    required super.reviewCount,
    required super.isAvailable,
    required super.isFeatured,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ServiceModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ServiceModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      categoryId: json['categoryId'],
      providerId: json['providerId'],
      price: (json['price'] as num).toDouble(),
      currency: json['currency'],
      images: List<String>.from(json['images'] ?? []),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      isAvailable: json['isAvailable'] ?? true,
      isFeatured: json['isFeatured'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'categoryId': categoryId,
      'providerId': providerId,
      'price': price,
      'currency': currency,
      'images': images,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'isFeatured': isFeatured,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}