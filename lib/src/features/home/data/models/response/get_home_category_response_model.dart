import 'package:stackfood/src/core/utils/safe_parser.dart';
import 'package:stackfood/src/features/home/domain/entities/home_category_entity.dart';

class GetHomeCategoryResponseModel {
  List<HomeCategoryModel>? categories;

  GetHomeCategoryResponseModel({this.categories});

  factory GetHomeCategoryResponseModel.fromJson(List<dynamic> json) {
    return GetHomeCategoryResponseModel(
      categories: json.map((e) => HomeCategoryModel.fromMap(e)).toList(),
    );
  }
}

class HomeCategoryModel extends HomeCategoryEntity {
  HomeCategoryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.parentId,
    required super.position,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.priority,
    required super.slug,
    required super.productsCount,
    required super.childesCount,
    required super.orderCount,
    required super.imageFullUrl,
  });

  /// Creates a [HomeCategoryModel] from a JSON [map].
  factory HomeCategoryModel.fromMap(Map<String, dynamic> map) {
    return HomeCategoryModel(
      id: safeInt(map['id']),
      name: safeString(map['name'], 'name'),
      image: safeString(map['image'], 'image'),
      parentId: safeInt(map['parent_id']),
      position: safeInt(map['position']),
      status: safeInt(map['status']),
      createdAt: safeString(map['created_at'], 'created_at'),
      updatedAt: safeString(map['updated_at'], 'updated_at'),
      priority: safeInt(map['priority']),
      slug: safeString(map['slug'], 'slug'),
      productsCount: safeInt(map['products_count']),
      childesCount: safeInt(map['childes_count']),
      orderCount: safeString(map['order_count']),
      imageFullUrl: safeString(map['image_full_url'], 'image_full_url'),
    );
  }
}

extension BannerModelX on HomeCategoryModel {
  HomeCategoryEntity toEntity() {
    return HomeCategoryEntity(
      id: id,
      name: name,
      image: image,
      parentId: parentId,
      position: position,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      priority: priority,
      slug: slug,
      productsCount: productsCount,
      childesCount: childesCount,
      orderCount: orderCount,
      imageFullUrl: imageFullUrl,
    );
  }
}
