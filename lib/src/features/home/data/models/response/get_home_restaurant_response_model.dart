import 'package:stackfood/src/core/utils/safe_parser.dart';
import 'package:stackfood/src/features/home/domain/entities/home_restaurant_entity.dart';

class GetHomeRestaurantsResponseModel {
  final String filterData;
  final int totalSize;
  final int? limit;
  final int? offset;
  final List<HomeRestaurantModel> restaurants;

  GetHomeRestaurantsResponseModel({
    required this.filterData,
    required this.totalSize,
    this.limit,
    this.offset,
    required this.restaurants,
  });

  factory GetHomeRestaurantsResponseModel.fromJson(Map<String, dynamic> json) =>
      GetHomeRestaurantsResponseModel(
        filterData: safeString(json['filter_data']),
        totalSize: safeInt(json['total_size']),
        limit: safeIntOrNull(json['limit']),
        offset: safeIntOrNull(json['offset']),
        restaurants:
            (json['restaurants'] as List<dynamic>?)
                ?.map((e) => HomeRestaurantModel.fromMap(e))
                .toList() ??
            [],
      );
}

/// ------------------------------------------------------------------
///  Restaurant Model
/// ------------------------------------------------------------------
class HomeRestaurantModel {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String logo;
  final String latitude;
  final String longitude;
  final String address;
  final String? footerText;
  final int minimumOrder;
  final int? comission;
  final bool scheduleOrder;
  final String? openingTime;
  final String? closeingTime;
  final int status;
  final int vendorId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool freeDelivery;
  final String coverPhoto;
  final bool delivery;
  final bool takeAway;
  final bool foodSection;
  final double tax;
  final int zoneId;
  final bool reviewsSection;
  final bool active;
  final String offDay;
  final int selfDeliverySystem;
  final bool posSystem;
  final int minimumShippingCharge;
  final String deliveryTime;
  final int veg;
  final int nonVeg;
  final int orderCount;
  final int totalOrder;
  final int? perKmShippingCharge;
  final String restaurantModel;
  final int? maximumShippingCharge;
  final String slug;
  final bool orderSubscriptionActive;
  final bool cutlery;
  final String? metaTitle;
  final String? metaDescription;
  final String? metaImage;
  final int announcement;
  final String announcementMessage;
  final String? qrCode;
  final String? additionalData;
  final String additionalDocuments;
  final int? packageId;
  final String? tin;
  final String? tinExpireDate;
  final String? tinCertificateImage;
  final int open;
  final double distance;
  final int foodsCount;
  final int reviewsCommentsCount;
  final List<FoodPreviewModel> foods;
  final List<CouponModel> coupons;
  final String deliveryFee;
  final int restaurantStatus;
  final List<CuisineModel> cuisine;
  final List<dynamic> ratings;
  final double avgRating;
  final int ratingCount;
  final int positiveRating;
  final int customerOrderDate;
  final bool customerDateOrderSratus;
  final bool instantOrder;
  final bool halalTagStatus;
  final String currentOpeningTime;
  final bool isExtraPackagingActive;
  final bool extraPackagingStatus;
  final int extraPackagingAmount;
  final bool isDineInActive;
  final int scheduleAdvanceDineInBookingDuration;
  final String scheduleAdvanceDineInBookingDurationTimeFormat;
  final List<String> characteristics;
  final bool gstStatus;
  final String gstCode;
  final bool freeDeliveryDistanceStatus;
  final String freeDeliveryDistanceValue;
  final String logoFullUrl;
  final String coverPhotoFullUrl;
  final String? metaImageFullUrl;
  final String? tinCertificateImageFullUrl;
  final List<TranslationModel> translations;
  final List<StorageModel> storage;
  final String? discount;
  final RestaurantSubModel? restaurantSub;
  final List<ScheduleModel> schedules;

  HomeRestaurantModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.logo,
    required this.latitude,
    required this.longitude,
    required this.address,
    this.footerText,
    required this.minimumOrder,
    this.comission,
    required this.scheduleOrder,
    this.openingTime,
    this.closeingTime,
    required this.status,
    required this.vendorId,
    required this.createdAt,
    required this.updatedAt,
    required this.freeDelivery,
    required this.coverPhoto,
    required this.delivery,
    required this.takeAway,
    required this.foodSection,
    required this.tax,
    required this.zoneId,
    required this.reviewsSection,
    required this.active,
    required this.offDay,
    required this.selfDeliverySystem,
    required this.posSystem,
    required this.minimumShippingCharge,
    required this.deliveryTime,
    required this.veg,
    required this.nonVeg,
    required this.orderCount,
    required this.totalOrder,
    this.perKmShippingCharge,
    required this.restaurantModel,
    this.maximumShippingCharge,
    required this.slug,
    required this.orderSubscriptionActive,
    required this.cutlery,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    required this.announcement,
    required this.announcementMessage,
    this.qrCode,
    this.additionalData,
    required this.additionalDocuments,
    this.packageId,
    this.tin,
    this.tinExpireDate,
    this.tinCertificateImage,
    required this.open,
    required this.distance,
    required this.foodsCount,
    required this.reviewsCommentsCount,
    required this.foods,
    required this.coupons,
    required this.deliveryFee,
    required this.restaurantStatus,
    required this.cuisine,
    required this.ratings,
    required this.avgRating,
    required this.ratingCount,
    required this.positiveRating,
    required this.customerOrderDate,
    required this.customerDateOrderSratus,
    required this.instantOrder,
    required this.halalTagStatus,
    required this.currentOpeningTime,
    required this.isExtraPackagingActive,
    required this.extraPackagingStatus,
    required this.extraPackagingAmount,
    required this.isDineInActive,
    required this.scheduleAdvanceDineInBookingDuration,
    required this.scheduleAdvanceDineInBookingDurationTimeFormat,
    required this.characteristics,
    required this.gstStatus,
    required this.gstCode,
    required this.freeDeliveryDistanceStatus,
    required this.freeDeliveryDistanceValue,
    required this.logoFullUrl,
    required this.coverPhotoFullUrl,
    this.metaImageFullUrl,
    this.tinCertificateImageFullUrl,
    required this.translations,
    required this.storage,
    this.discount,
    this.restaurantSub,
    required this.schedules,
  });

  factory HomeRestaurantModel.fromMap(
    Map<String, dynamic> map,
  ) => HomeRestaurantModel(
    id: safeInt(map['id']),
    name: safeString(map['name']),
    phone: safeString(map['phone']),
    email: safeString(map['email']),
    logo: safeString(map['logo']),
    latitude: safeString(map['latitude']),
    longitude: safeString(map['longitude']),
    address: safeString(map['address']),
    footerText: safeStringOrNull(map['footer_text']),
    minimumOrder: safeInt(map['minimum_order']),
    comission: safeIntOrNull(map['comission']),
    scheduleOrder: safeBool(map['schedule_order']),
    openingTime: safeStringOrNull(map['opening_time']),
    closeingTime: safeStringOrNull(map['closeing_time']),
    status: safeInt(map['status']),
    vendorId: safeInt(map['vendor_id']),
    createdAt: safeDateTime(map['created_at'])!,
    updatedAt: safeDateTime(map['updated_at'])!,
    freeDelivery: safeBool(map['free_delivery']),
    coverPhoto: safeString(map['cover_photo']),
    delivery: safeBool(map['delivery']),
    takeAway: safeBool(map['take_away']),
    foodSection: safeBool(map['food_section']),
    tax: safeDouble(map['tax']),
    zoneId: safeInt(map['zone_id']),
    reviewsSection: safeBool(map['reviews_section']),
    active: safeBool(map['active']),
    offDay: safeString(map['off_day']),
    selfDeliverySystem: safeInt(map['self_delivery_system']),
    posSystem: safeBool(map['pos_system']),
    minimumShippingCharge: safeInt(map['minimum_shipping_charge']),
    deliveryTime: safeString(map['delivery_time']),
    veg: safeInt(map['veg']),
    nonVeg: safeInt(map['non_veg']),
    orderCount: safeInt(map['order_count']),
    totalOrder: safeInt(map['total_order']),
    perKmShippingCharge: safeIntOrNull(map['per_km_shipping_charge']),
    restaurantModel: safeString(map['restaurant_model']),
    maximumShippingCharge: safeIntOrNull(map['maximum_shipping_charge']),
    slug: safeString(map['slug']),
    orderSubscriptionActive: safeBool(map['order_subscription_active']),
    cutlery: safeBool(map['cutlery']),
    metaTitle: safeStringOrNull(map['meta_title']),
    metaDescription: safeStringOrNull(map['meta_description']),
    metaImage: safeStringOrNull(map['meta_image']),
    announcement: safeInt(map['announcement']),
    announcementMessage: safeString(map['announcement_message']),
    qrCode: safeStringOrNull(map['qr_code']),
    additionalData: safeStringOrNull(map['additional_data']),
    additionalDocuments: safeString(map['additional_documents']),
    packageId: safeIntOrNull(map['package_id']),
    tin: safeStringOrNull(map['tin']),
    tinExpireDate: safeStringOrNull(map['tin_expire_date']),
    tinCertificateImage: safeStringOrNull(map['tin_certificate_image']),
    open: safeInt(map['open']),
    distance: safeDouble(map['distance']),
    foodsCount: safeInt(map['foods_count']),
    reviewsCommentsCount: safeInt(map['reviews_comments_count']),
    foods:
        (map['foods'] as List<dynamic>?)
            ?.map((e) => FoodPreviewModel.fromMap(e))
            .toList() ??
        [],
    coupons:
        (map['coupons'] as List<dynamic>?)
            ?.map((e) => CouponModel.fromMap(e))
            .toList() ??
        [],
    deliveryFee: safeString(map['delivery_fee']),
    restaurantStatus: safeInt(map['restaurant_status']),
    cuisine:
        (map['cuisine'] as List<dynamic>?)
            ?.map((e) => CuisineModel.fromMap(e))
            .toList() ??
        [],
    ratings: map['ratings'] as List<dynamic>? ?? [],
    avgRating: safeDouble(map['avg_rating']),
    ratingCount: safeInt(map['rating_count']),
    positiveRating: safeInt(map['positive_rating']),
    customerOrderDate: safeInt(map['customer_order_date']),
    customerDateOrderSratus: safeBool(map['customer_date_order_sratus']),
    instantOrder: safeBool(map['instant_order']),
    halalTagStatus: safeBool(map['halal_tag_status']),
    currentOpeningTime: safeString(map['current_opening_time']),
    isExtraPackagingActive: safeBool(map['is_extra_packaging_active']),
    extraPackagingStatus: safeBool(map['extra_packaging_status']),
    extraPackagingAmount: safeInt(map['extra_packaging_amount']),
    isDineInActive: safeBool(map['is_dine_in_active']),
    scheduleAdvanceDineInBookingDuration: safeInt(
      map['schedule_advance_dine_in_booking_duration'],
    ),
    scheduleAdvanceDineInBookingDurationTimeFormat: safeString(
      map['schedule_advance_dine_in_booking_duration_time_format'],
    ),
    characteristics: ((map['characteristics'] ?? []) as List<dynamic>)
        .map((e) => safeString(e))
        .toList(),
    gstStatus: safeBool(map['gst_status']),
    gstCode: safeString(map['gst_code']),
    freeDeliveryDistanceStatus: safeBool(map['free_delivery_distance_status']),
    freeDeliveryDistanceValue: safeString(map['free_delivery_distance_value']),
    logoFullUrl: safeString(map['logo_full_url']),
    coverPhotoFullUrl: safeString(map['cover_photo_full_url']),
    metaImageFullUrl: safeStringOrNull(map['meta_image_full_url']),
    tinCertificateImageFullUrl: safeStringOrNull(
      map['tin_certificate_image_full_url'],
    ),
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
    discount: safeStringOrNull(map['discount']),
    restaurantSub: map['restaurant_sub'] == null
        ? null
        : RestaurantSubModel.fromMap(map['restaurant_sub']),
    schedules:
        (map['schedules'] as List<dynamic>?)
            ?.map((e) => ScheduleModel.fromMap(e))
            .toList() ??
        [],
  );
}

/// ------------------------------------------------------------------
///  FoodPreview (short version inside Restaurant)
/// ------------------------------------------------------------------
class FoodPreviewModel {
  final int id;
  final String image;
  final String name;
  final String imageFullUrl;
  final List<StorageModel> storage;
  final List<TranslationModel> translations;

  FoodPreviewModel({
    required this.id,
    required this.image,
    required this.name,
    required this.imageFullUrl,
    required this.storage,
    required this.translations,
  });

  factory FoodPreviewModel.fromMap(Map<String, dynamic> map) =>
      FoodPreviewModel(
        id: safeInt(map['id']),
        image: safeString(map['image']),
        name: safeString(map['name']),
        imageFullUrl: safeString(map['image_full_url']),
        storage:
            (map['storage'] as List<dynamic>?)
                ?.map((e) => StorageModel.fromMap(e))
                .toList() ??
            [],
        translations:
            (map['translations'] as List<dynamic>?)
                ?.map((e) => TranslationModel.fromMap(e))
                .toList() ??
            [],
      );
}

/// ------------------------------------------------------------------
///  Coupon
/// ------------------------------------------------------------------
class CouponModel {
  final int id;
  final String title;
  final String code;
  final String startDate;
  final String expireDate;
  final int minPurchase;
  final int maxDiscount;
  final double discount;
  final String discountType;
  final String couponType;
  final int limit;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String data;
  final int totalUses;
  final String createdBy;
  final String customerId;
  final String? slug;
  final int? restaurantId;
  final List<TranslationModel> translations;

  CouponModel({
    required this.id,
    required this.title,
    required this.code,
    required this.startDate,
    required this.expireDate,
    required this.minPurchase,
    required this.maxDiscount,
    required this.discount,
    required this.discountType,
    required this.couponType,
    required this.limit,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.data,
    required this.totalUses,
    required this.createdBy,
    required this.customerId,
    this.slug,
    this.restaurantId,
    required this.translations,
  });

  factory CouponModel.fromMap(Map<String, dynamic> map) => CouponModel(
    id: safeInt(map['id']),
    title: safeString(map['title']),
    code: safeString(map['code']),
    startDate: safeString(map['start_date']),
    expireDate: safeString(map['expire_date']),
    minPurchase: safeInt(map['min_purchase']),
    maxDiscount: safeInt(map['max_discount']),
    discount: safeDouble(map['discount']),
    discountType: safeString(map['discount_type']),
    couponType: safeString(map['coupon_type']),
    limit: safeInt(map['limit']),
    status: safeInt(map['status']),
    createdAt: safeDateTime(map['created_at'])!,
    updatedAt: safeDateTime(map['updated_at'])!,
    data: safeString(map['data']),
    totalUses: safeInt(map['total_uses']),
    createdBy: safeString(map['created_by']),
    customerId: safeString(map['customer_id']),
    slug: safeStringOrNull(map['slug']),
    restaurantId: safeIntOrNull(map['restaurant_id']),
    translations:
        (map['translations'] as List<dynamic>?)
            ?.map((e) => TranslationModel.fromMap(e))
            .toList() ??
        [],
  );
}

/// ------------------------------------------------------------------
///  Cuisine
/// ------------------------------------------------------------------
class CuisineModel {
  final int id;
  final String name;
  final String image;
  final int status;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String imageFullUrl;
  final PivotModel pivot;
  final List<TranslationModel> translations;
  final List<StorageModel> storage;

  CuisineModel({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.imageFullUrl,
    required this.pivot,
    required this.translations,
    required this.storage,
  });

  factory CuisineModel.fromMap(Map<String, dynamic> map) => CuisineModel(
    id: safeInt(map['id']),
    name: safeString(map['name']),
    image: safeString(map['image']),
    status: safeInt(map['status']),
    slug: safeString(map['slug']),
    createdAt: safeDateTime(map['created_at'])!,
    updatedAt: safeDateTime(map['updated_at'])!,
    imageFullUrl: safeString(map['image_full_url']),
    pivot: PivotModel.fromMap(map['pivot'] ?? {}),
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

class PivotModel {
  final int restaurantId;
  final int cuisineId;

  PivotModel({required this.restaurantId, required this.cuisineId});

  factory PivotModel.fromMap(Map<String, dynamic> map) => PivotModel(
    restaurantId: safeInt(map['restaurant_id']),
    cuisineId: safeInt(map['cuisine_id']),
  );
}

/// ------------------------------------------------------------------
///  Restaurant Subscription
/// ------------------------------------------------------------------
class RestaurantSubModel {
  final int id;
  final int packageId;
  final int restaurantId;
  final DateTime expiryDate;
  final String maxOrder;
  final String maxProduct;
  final int pos;
  final int mobileApp;
  final int chat;
  final int review;
  final int selfDelivery;
  final int status;
  final int totalPackageRenewed;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int validity;
  final int isTrial;
  final DateTime renewedAt;
  final int isCanceled;
  final String canceledBy;

  RestaurantSubModel({
    required this.id,
    required this.packageId,
    required this.restaurantId,
    required this.expiryDate,
    required this.maxOrder,
    required this.maxProduct,
    required this.pos,
    required this.mobileApp,
    required this.chat,
    required this.review,
    required this.selfDelivery,
    required this.status,
    required this.totalPackageRenewed,
    required this.createdAt,
    required this.updatedAt,
    required this.validity,
    required this.isTrial,
    required this.renewedAt,
    required this.isCanceled,
    required this.canceledBy,
  });

  factory RestaurantSubModel.fromMap(Map<String, dynamic> map) =>
      RestaurantSubModel(
        id: safeInt(map['id']),
        packageId: safeInt(map['package_id']),
        restaurantId: safeInt(map['restaurant_id']),
        expiryDate: safeDateTime(map['expiry_date'])!,
        maxOrder: safeString(map['max_order']),
        maxProduct: safeString(map['max_product']),
        pos: safeInt(map['pos']),
        mobileApp: safeInt(map['mobile_app']),
        chat: safeInt(map['chat']),
        review: safeInt(map['review']),
        selfDelivery: safeInt(map['self_delivery']),
        status: safeInt(map['status']),
        totalPackageRenewed: safeInt(map['total_package_renewed']),
        createdAt: safeDateTime(map['created_at'])!,
        updatedAt: safeDateTime(map['updated_at'])!,
        validity: safeInt(map['validity']),
        isTrial: safeInt(map['is_trial']),
        renewedAt: safeDateTime(map['renewed_at'])!,
        isCanceled: safeInt(map['is_canceled']),
        canceledBy: safeString(map['canceled_by']),
      );
}

/// ------------------------------------------------------------------
///  Schedule
/// ------------------------------------------------------------------
class ScheduleModel {
  final int id;
  final int restaurantId;
  final int day;
  final String openingTime;
  final String closingTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ScheduleModel({
    required this.id,
    required this.restaurantId,
    required this.day,
    required this.openingTime,
    required this.closingTime,
    this.createdAt,
    this.updatedAt,
  });

  factory ScheduleModel.fromMap(Map<String, dynamic> map) => ScheduleModel(
    id: safeInt(map['id']),
    restaurantId: safeInt(map['restaurant_id']),
    day: safeInt(map['day']),
    openingTime: safeString(map['opening_time']),
    closingTime: safeString(map['closing_time']),
    createdAt: safeDateTimeOrNull(map['created_at']),
    updatedAt: safeDateTimeOrNull(map['updated_at']),
  );
}

/// ------------------------------------------------------------------
///  Re-usable Translation & Storage
/// ------------------------------------------------------------------
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
    createdAt: safeDateTime(map['created_at'])!,
    updatedAt: safeDateTime(map['updated_at'])!,
  );
}

// Convert to Entity
extension HomeRestaurantModelEx on HomeRestaurantModel {
  HomeRestaurantEntity toEntity() {
    return HomeRestaurantEntity(
      id: id,
      name: name,
      phone: phone,
      email: email,
      latitude: latitude,
      longitude: longitude,
      address: address,
      minimumOrder: minimumOrder,
      scheduleOrder: scheduleOrder,
      status: status,
      vendorId: vendorId,
      freeDelivery: freeDelivery,
      coverPhoto: coverPhoto,
      delivery: delivery,
      takeAway: takeAway,
      foodSection: foodSection,
      tax: tax,
      zoneId: zoneId,
      reviewsSection: reviewsSection,
      active: active,
      offDay: offDay,
      selfDeliverySystem: selfDeliverySystem,
      posSystem: posSystem,
      minimumShippingCharge: minimumShippingCharge,
      deliveryTime: deliveryTime,
      veg: veg,
      nonVeg: nonVeg,
      orderCount: orderCount,
      totalOrder: totalOrder,
      restaurantModel: restaurantModel,
      slug: slug,
      orderSubscriptionActive: orderSubscriptionActive,
      cutlery: cutlery,
      metaTitle: metaTitle ?? '',
      metaDescription: metaDescription ?? '',
      metaImageFullUrl: metaImageFullUrl ?? '',
      announcementMessage: announcementMessage,
      additionalDocuments: additionalDocuments,
      announcement: announcement,
      avgRating: avgRating,
      characteristics: characteristics,
      gstStatus: gstStatus,
      gstCode: gstCode,
      freeDeliveryDistanceStatus: freeDeliveryDistanceStatus,
      freeDeliveryDistanceValue: freeDeliveryDistanceValue,
      logoFullUrl: logoFullUrl,
      coverPhotoFullUrl: coverPhotoFullUrl,
      currentOpeningTime: currentOpeningTime,
      isExtraPackagingActive: isExtraPackagingActive,
      extraPackagingStatus: extraPackagingStatus,
      extraPackagingAmount: extraPackagingAmount,
      isDineInActive: isDineInActive,
      scheduleAdvanceDineInBookingDuration:
          scheduleAdvanceDineInBookingDuration,
      scheduleAdvanceDineInBookingDurationTimeFormat:
          scheduleAdvanceDineInBookingDurationTimeFormat,
      customerDateOrderStatus: customerDateOrderSratus,
      halalTagStatus: halalTagStatus,
      instantOrder: instantOrder,
      distance: distance,
      foodsCount: foodsCount,
      reviewsCommentsCount: reviewsCommentsCount,
      deliveryFee: deliveryFee,
      restaurantStatus: restaurantStatus,
      customerOrderDate: customerOrderDate,
      metaImage: metaImage ?? '',
      open: open,
      positiveRating: positiveRating,
      ratingCount: ratingCount,
    );
  }
}
