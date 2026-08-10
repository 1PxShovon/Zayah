import '../../domain/entities/service_category.dart';

class ServiceCategoryModel extends ServiceCategory {
  const ServiceCategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.icon,
    required super.isActive,
    required super.sortOrder,
  });

  factory ServiceCategoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ServiceCategoryModel(
      id: json["id"],
      name: json["name"],
      imageUrl: json["imageUrl"],
      icon: json["icon"],
      isActive: json["isActive"],
      sortOrder: json["sortOrder"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "imageUrl": imageUrl,
      "icon": icon,
      "isActive": isActive,
      "sortOrder": sortOrder,
    };
  }
}