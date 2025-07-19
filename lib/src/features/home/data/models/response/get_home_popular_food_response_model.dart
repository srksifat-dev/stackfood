import 'package:stackfood/src/core/utils/safe_parser.dart';
import 'package:stackfood/src/features/home/domain/entities/home_popular_food_entity.dart';

class GetHomePopularFoodResponseModel {
  final int totalSize;
  final int? limit;
  final int? offset;
  final List<HomePopularFoodModel> products;

  GetHomePopularFoodResponseModel({
    required this.totalSize,
    this.limit,
    this.offset,
    required this.products,
  });

  factory GetHomePopularFoodResponseModel.fromJson(Map<String, dynamic> json) {
    return GetHomePopularFoodResponseModel(
      totalSize: safeInt(json['total_size']),
      limit: safeIntOrNull(json['limit']),
      offset: safeIntOrNull(json['offset']),
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => HomePopularFoodModel.fromMap(e))
              .toList() ??
          [],
    );
  }
}

/// ------------------------------------------------------------------
///  Product (Food) Model
/// ------------------------------------------------------------------
class HomePopularFoodModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final int categoryId;
  final List<CategoryIdModel> categoryIds;
  final List<VariationModel> variations;
  final List<AddOnModel> addOns;
  final String attributes;
  final String choiceOptions;
  final double price;
  final double tax;
  final String taxType;
  final double discount;
  final String discountType;
  final String availableTimeStarts;
  final String availableTimeEnds;
  final int veg;
  final int status;
  final int restaurantId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int orderCount;
  final double avgRating;
  final int ratingCount;
  final int recommended;
  final String slug;
  final int? maximumCartQuantity;
  final int isHalal;
  final int itemStock;
  final int sellCount;
  final String stockType;
  final int tempAvailable;
  final int open;
  final int reviewsCount;
  final List<String> tags;
  final String restaurantName;
  final int restaurantStatus;
  final int restaurantDiscount;
  final String? restaurantOpeningTime;
  final String? restaurantClosingTime;
  final bool scheduleOrder;
  final int minDeliveryTime;
  final int maxDeliveryTime;
  final int freeDelivery;
  final int halalTagStatus;
  final List<String> nutritionsName;
  final List<String> allergiesName;
  final List<CuisineModel> cuisines;
  final List<dynamic> taxData;
  final String imageFullUrl;

  HomePopularFoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.categoryIds,
    required this.variations,
    required this.addOns,
    required this.attributes,
    required this.choiceOptions,
    required this.price,
    required this.tax,
    required this.taxType,
    required this.discount,
    required this.discountType,
    required this.availableTimeStarts,
    required this.availableTimeEnds,
    required this.veg,
    required this.status,
    required this.restaurantId,
    required this.createdAt,
    required this.updatedAt,
    required this.orderCount,
    required this.avgRating,
    required this.ratingCount,
    required this.recommended,
    required this.slug,
    this.maximumCartQuantity,
    required this.isHalal,
    required this.itemStock,
    required this.sellCount,
    required this.stockType,
    required this.tempAvailable,
    required this.open,
    required this.reviewsCount,
    required this.tags,
    required this.restaurantName,
    required this.restaurantStatus,
    required this.restaurantDiscount,
    this.restaurantOpeningTime,
    this.restaurantClosingTime,
    required this.scheduleOrder,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.freeDelivery,
    required this.halalTagStatus,
    required this.nutritionsName,
    required this.allergiesName,
    required this.cuisines,
    required this.taxData,
    required this.imageFullUrl,
  });

  factory HomePopularFoodModel.fromMap(Map<String, dynamic> map) {
    return HomePopularFoodModel(
      id: safeInt(map['id']),
      name: safeString(map['name']),
      description: safeString(map['description']),
      image: safeString(map['image']),
      categoryId: safeInt(map['category_id']),
      categoryIds:
          (map['category_ids'] as List<dynamic>?)
              ?.map((e) => CategoryIdModel.fromMap(e))
              .toList() ??
          [],
      variations:
          (map['variations'] as List<dynamic>?)
              ?.map((e) => VariationModel.fromMap(e))
              .toList() ??
          [],
      addOns:
          (map['add_ons'] as List<dynamic>?)
              ?.map((e) => AddOnModel.fromMap(e))
              .toList() ??
          [],
      attributes: safeString(map['attributes']),
      choiceOptions: safeString(map['choice_options']),
      price: safeDouble(map['price']),
      tax: safeDouble(map['tax']),
      taxType: safeString(map['tax_type']),
      discount: safeDouble(map['discount']),
      discountType: safeString(map['discount_type']),
      availableTimeStarts: safeString(map['available_time_starts']),
      availableTimeEnds: safeString(map['available_time_ends']),
      veg: safeInt(map['veg']),
      status: safeInt(map['status']),
      restaurantId: safeInt(map['restaurant_id']),
      createdAt: safeDateTime(map['created_at'])!,
      updatedAt: safeDateTime(map['updated_at'])!,
      orderCount: safeInt(map['order_count']),
      avgRating: safeDouble(map['avg_rating']),
      ratingCount: safeInt(map['rating_count']),
      recommended: safeInt(map['recommended']),
      slug: safeString(map['slug']),
      maximumCartQuantity: safeIntOrNull(map['maximum_cart_quantity']),
      isHalal: safeInt(map['is_halal']),
      itemStock: safeInt(map['item_stock']),
      sellCount: safeInt(map['sell_count']),
      stockType: safeString(map['stock_type']),
      tempAvailable: safeInt(map['temp_available']),
      open: safeInt(map['open']),
      reviewsCount: safeInt(map['reviews_count']),
      tags: ((map['tags'] ?? []) as List<dynamic>)
          .map((e) => safeString(e is Map<String, dynamic> ? e['tag'] : e))
          .toList(),
      restaurantName: safeString(map['restaurant_name']),
      restaurantStatus: safeInt(map['restaurant_status']),
      restaurantDiscount: safeInt(map['restaurant_discount']),
      restaurantOpeningTime: safeStringOrNull(map['restaurant_opening_time']),
      restaurantClosingTime: safeStringOrNull(map['restaurant_closing_time']),
      scheduleOrder: safeBool(map['schedule_order']),
      minDeliveryTime: safeInt(map['min_delivery_time']),
      maxDeliveryTime: safeInt(map['max_delivery_time']),
      freeDelivery: safeInt(map['free_delivery']),
      halalTagStatus: safeInt(map['halal_tag_status']),
      nutritionsName: ((map['nutritions_name'] ?? []) as List<dynamic>)
          .map((e) => safeString(e))
          .toList(),
      allergiesName: ((map['allergies_name'] ?? []) as List<dynamic>)
          .map((e) => safeString(e))
          .toList(),
      cuisines:
          (map['cuisines'] as List<dynamic>?)
              ?.map((e) => CuisineModel.fromMap(e))
              .toList() ??
          [],
      taxData: (map['tax_data'] ?? []) as List<dynamic>,
      imageFullUrl: safeString(map['image_full_url']),
    );
  }
}

/// ------------------------------------------------------------------
///  CategoryId
/// ------------------------------------------------------------------
class CategoryIdModel {
  final int id;
  final int position;

  CategoryIdModel({required this.id, required this.position});

  factory CategoryIdModel.fromMap(Map<String, dynamic> map) => CategoryIdModel(
    id: safeInt(map['id']),
    position: safeInt(map['position']),
  );
}

/// ------------------------------------------------------------------
///  Variation
/// ------------------------------------------------------------------
class VariationModel {
  final int? variationId;
  final String name;
  final String type;
  final int min;
  final int max;
  final String required;
  final List<VariationValueModel> values;

  VariationModel({
    this.variationId,
    required this.name,
    required this.type,
    required this.min,
    required this.max,
    required this.required,
    required this.values,
  });

  factory VariationModel.fromMap(Map<String, dynamic> map) => VariationModel(
    variationId: safeIntOrNull(map['variation_id']),
    name: safeString(map['name']),
    type: safeString(map['type']),
    min: safeInt(map['min']),
    max: safeInt(map['max']),
    required: safeString(map['required']),
    values:
        (map['values'] as List<dynamic>?)
            ?.map((e) => VariationValueModel.fromMap(e))
            .toList() ??
        [],
  );
}

class VariationValueModel {
  final String label;
  final double optionPrice;
  final int totalStock;
  final String stockType;
  final int sellCount;
  final int optionId;
  final int currentStock;

  VariationValueModel({
    required this.label,
    required this.optionPrice,
    required this.totalStock,
    required this.stockType,
    required this.sellCount,
    required this.optionId,
    required this.currentStock,
  });

  factory VariationValueModel.fromMap(Map<String, dynamic> map) =>
      VariationValueModel(
        label: safeString(map['label']),
        optionPrice: safeDouble(map['optionPrice']),
        totalStock: safeInt(map['total_stock']),
        stockType: safeString(map['stock_type']),
        sellCount: safeInt(map['sell_count']),
        optionId: safeInt(map['option_id']),
        currentStock: safeInt(map['current_stock']),
      );
}

/// ------------------------------------------------------------------
///  AddOn
/// ------------------------------------------------------------------
class AddOnModel {
  final int id;
  final String name;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int restaurantId;
  final int status;
  final String stockType;
  final int addonStock;
  final int sellCount;
  final int? addonCategoryId;
  final List<int> taxIds;
  final List<dynamic> translations;

  AddOnModel({
    required this.id,
    required this.name,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.restaurantId,
    required this.status,
    required this.stockType,
    required this.addonStock,
    required this.sellCount,
    this.addonCategoryId,
    required this.taxIds,
    required this.translations,
  });

  factory AddOnModel.fromMap(Map<String, dynamic> map) => AddOnModel(
    id: safeInt(map['id']),
    name: safeString(map['name']),
    price: safeDouble(map['price']),
    createdAt: safeDateTime(map['created_at'])!,
    updatedAt: safeDateTime(map['updated_at'])!,
    restaurantId: safeInt(map['restaurant_id']),
    status: safeInt(map['status']),
    stockType: safeString(map['stock_type']),
    addonStock: safeInt(map['addon_stock']),
    sellCount: safeInt(map['sell_count']),
    addonCategoryId: safeIntOrNull(map['addon_category_id']),
    taxIds: ((map['tax_ids'] ?? []) as List<dynamic>)
        .map((e) => safeInt(e))
        .toList(),
    translations: (map['translations'] ?? []) as List<dynamic>,
  );
}

/// ------------------------------------------------------------------
///  Cuisine
/// ------------------------------------------------------------------
class CuisineModel {
  final int id;
  final String name;
  final String image;

  CuisineModel({required this.id, required this.name, required this.image});

  factory CuisineModel.fromMap(Map<String, dynamic> map) => CuisineModel(
    id: safeInt(map['id']),
    name: safeString(map['name']),
    image: safeString(map['image']),
  );
}

extension PopularFoodModelEx on HomePopularFoodModel {
  HomePopularFoodEntity toEntity() {
    return HomePopularFoodEntity(
      id: id,
      name: name,
      description: description,
      image: image,
      categoryId: categoryId,
      price: price,
      restaurantId: restaurantId,
      avgRating: avgRating,
      restaurantName: restaurantName,
      imageFullUrl: imageFullUrl,
    );
  }
}
