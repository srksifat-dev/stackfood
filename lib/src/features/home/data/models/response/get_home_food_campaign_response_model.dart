import 'package:stackfood/src/core/utils/safe_parser.dart';
import 'package:stackfood/src/features/home/domain/entities/home_food_campaign_entity.dart';

class GetFoodCampaignResponseModel {
  final List<HomeFoodCampaignModel> campaigns;

  GetFoodCampaignResponseModel({required this.campaigns});

  factory GetFoodCampaignResponseModel.fromJson(List<dynamic> json) =>
      GetFoodCampaignResponseModel(
        campaigns: json.map((e) => HomeFoodCampaignModel.fromMap(e)).toList(),
      );
}

/// ----------------------------------------------------------
///  Campaign (ItemCampaign) Model
/// ----------------------------------------------------------
class HomeFoodCampaignModel {
  final int id;
  final String image;
  final String description;
  final int status;
  final int adminId;
  final int? categoryId;
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
  final int restaurantId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int veg;
  final String? slug;
  final int? maximumCartQuantity;
  final int tempAvailable;
  final int open;
  final String name;
  final String availableTimeStarts;
  final String availableTimeEnds;
  final String availableDateStarts;
  final String availableDateEnds;
  final int recommended;
  final List<String>? tags;
  final String restaurantName;
  final int restaurantStatus;
  final int restaurantDiscount;
  final String? restaurantOpeningTime;
  final String? restaurantClosingTime;
  final bool scheduleOrder;
  final int ratingCount;
  final double avgRating;
  final int minDeliveryTime;
  final int maxDeliveryTime;
  final int freeDelivery;
  final int halalTagStatus;
  final List<String>? nutritionsName;
  final List<String>? allergiesName;
  final List<CuisineModel> cuisines;
  final List<dynamic> taxData;
  final String imageFullUrl;
  final List<TranslationModel> translations;
  final List<StorageModel> storage;

  HomeFoodCampaignModel({
    required this.id,
    required this.image,
    required this.description,
    required this.status,
    required this.adminId,
    this.categoryId,
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
    required this.restaurantId,
    required this.createdAt,
    required this.updatedAt,
    required this.veg,
    this.slug,
    this.maximumCartQuantity,
    required this.tempAvailable,
    required this.open,
    required this.name,
    required this.availableTimeStarts,
    required this.availableTimeEnds,
    required this.availableDateStarts,
    required this.availableDateEnds,
    required this.recommended,
    this.tags,
    required this.restaurantName,
    required this.restaurantStatus,
    required this.restaurantDiscount,
    this.restaurantOpeningTime,
    this.restaurantClosingTime,
    required this.scheduleOrder,
    required this.ratingCount,
    required this.avgRating,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.freeDelivery,
    required this.halalTagStatus,
    this.nutritionsName,
    this.allergiesName,
    required this.cuisines,
    required this.taxData,
    required this.imageFullUrl,
    required this.translations,
    required this.storage,
  });

  factory HomeFoodCampaignModel.fromMap(Map<String, dynamic> map) =>
      HomeFoodCampaignModel(
        id: safeInt(map['id']),
        image: safeString(map['image']),
        description: safeString(map['description']),
        status: safeInt(map['status']),
        adminId: safeInt(map['admin_id']),
        categoryId: safeIntOrNull(map['category_id']),
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
        restaurantId: safeInt(map['restaurant_id']),
        createdAt: safeDateTime(map['created_at'])!,
        updatedAt: safeDateTime(map['updated_at'])!,
        veg: safeInt(map['veg']),
        slug: safeStringOrNull(map['slug']),
        maximumCartQuantity: safeIntOrNull(map['maximum_cart_quantity']),
        tempAvailable: safeInt(map['temp_available']),
        open: safeInt(map['open']),
        name: safeString(map['name']),
        availableTimeStarts: safeString(map['available_time_starts']),
        availableTimeEnds: safeString(map['available_time_ends']),
        availableDateStarts: safeString(map['available_date_starts']),
        availableDateEnds: safeString(map['available_date_ends']),
        recommended: safeInt(map['recommended']),
        tags: map['tags'] == null
            ? null
            : ((map['tags'] as List<dynamic>)
                  .map(
                    (e) => safeString(e is Map<String, dynamic> ? e['tag'] : e),
                  )
                  .toList()),
        restaurantName: safeString(map['restaurant_name']),
        restaurantStatus: safeInt(map['restaurant_status']),
        restaurantDiscount: safeInt(map['restaurant_discount']),
        restaurantOpeningTime: safeStringOrNull(map['restaurant_opening_time']),
        restaurantClosingTime: safeStringOrNull(map['restaurant_closing_time']),
        scheduleOrder: safeBool(map['schedule_order']),
        ratingCount: safeInt(map['rating_count']),
        avgRating: safeDouble(map['avg_rating']),
        minDeliveryTime: safeInt(map['min_delivery_time']),
        maxDeliveryTime: safeInt(map['max_delivery_time']),
        freeDelivery: safeInt(map['free_delivery']),
        halalTagStatus: safeInt(map['halal_tag_status']),
        nutritionsName: map['nutritions_name'] == null
            ? null
            : ((map['nutritions_name'] as List<dynamic>)
                  .map((e) => safeString(e))
                  .toList()),
        allergiesName: map['allergies_name'] == null
            ? null
            : ((map['allergies_name'] as List<dynamic>)
                  .map((e) => safeString(e))
                  .toList()),
        cuisines:
            (map['cuisines'] as List<dynamic>?)
                ?.map((e) => CuisineModel.fromMap(e))
                .toList() ??
            [],
        taxData: map['tax_data'] as List<dynamic>? ?? [],
        imageFullUrl: safeString(map['image_full_url']),
        translations:
            (map['translations'] as List<dynamic>?)
                ?.map((e) => TranslationModel.fromMap(e))
                .toList() ??
            [],
        storage:
            (map['storage'] as List<dynamic>?)
                ?.map((e) => StorageModel.fromMap(e))
                .toList() ??
            [],
      );
}

/// ----------------------------------------------------------
///  Nested Models (re-usable)
/// ----------------------------------------------------------
class CategoryIdModel {
  final int id;
  final int position;
  CategoryIdModel({required this.id, required this.position});
  factory CategoryIdModel.fromMap(Map<String, dynamic> map) => CategoryIdModel(
    id: safeInt(map['id']),
    position: safeInt(map['position']),
  );
}

class VariationModel {
  final String name;
  final String type;
  final int min;
  final int max;
  final String required;
  final List<VariationValueModel> values;
  VariationModel({
    required this.name,
    required this.type,
    required this.min,
    required this.max,
    required this.required,
    required this.values,
  });
  factory VariationModel.fromMap(Map<String, dynamic> map) => VariationModel(
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
  VariationValueModel({required this.label, required this.optionPrice});
  factory VariationValueModel.fromMap(Map<String, dynamic> map) =>
      VariationValueModel(
        label: safeString(map['label']),
        optionPrice: safeDouble(map['optionPrice']),
      );
}

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
  final List<dynamic> taxIds;
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
    taxIds: map['tax_ids'] as List<dynamic>? ?? [],
    translations: map['translations'] as List<dynamic>? ?? [],
  );
}

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

class TranslationModel {
  final int id;
  final String translationableType;
  final int translationableId;
  final String locale;
  final String key;
  final String value;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  TranslationModel({
    required this.id,
    required this.translationableType,
    required this.translationableId,
    required this.locale,
    required this.key,
    required this.value,
    this.createdAt,
    this.updatedAt,
  });
  factory TranslationModel.fromMap(Map<String, dynamic> map) =>
      TranslationModel(
        id: safeInt(map['id']),
        translationableType: safeString(map['translationable_type']),
        translationableId: safeInt(map['translationable_id']),
        locale: safeString(map['locale']),
        key: safeString(map['key']),
        value: safeString(map['value']),
        createdAt: safeDateTimeOrNull(map['created_at']),
        updatedAt: safeDateTimeOrNull(map['updated_at']),
      );
}

class StorageModel {
  final int id;
  final String dataType;
  final String dataId;
  final String key;
  final String value;
  final DateTime createdAt;
  final DateTime updatedAt;
  StorageModel({
    required this.id,
    required this.dataType,
    required this.dataId,
    required this.key,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });
  factory StorageModel.fromMap(Map<String, dynamic> map) => StorageModel(
    id: safeInt(map['id']),
    dataType: safeString(map['data_type']),
    dataId: safeString(map['data_id']),
    key: safeString(map['key']),
    value: safeString(map['value']),
    createdAt: safeDateTime(map['created_at']),
    updatedAt: safeDateTime(map['updated_at']),
  );
}

extension FoodCampaignModelEx on HomeFoodCampaignModel {
  HomeFoodCampaignEntity toEntity() {
    return HomeFoodCampaignEntity(
      id: id,
      name: name,
      description: description,
      price: price,
      discount: discount,
      discountType: discountType,
      imageUrl: imageFullUrl,
      restaurantName: restaurantName,
      averageRating: avgRating,
    );
  }
}
