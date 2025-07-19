import 'package:stackfood/src/core/utils/safe_parser.dart';
import 'package:stackfood/src/features/home/domain/entities/home_banner_entity.dart';

class GetHomeBannerResponseModel {
  List<HomeBannerModel>? banners;

  GetHomeBannerResponseModel({this.banners});

  GetHomeBannerResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <HomeBannerModel>[];
      json['banners'].forEach((v) {
        banners!.add(HomeBannerModel.fromMap(v));
      });
    }
  }
}

class HomeBannerModel extends HomeBannerEntity {
  HomeBannerModel({
    required super.id,
    required super.title,
    required super.type,
    required super.imageUrl,
  });

  factory HomeBannerModel.fromMap(Map<String, dynamic> map) {
    return HomeBannerModel(
      id: safeInt(map['id']),
      title: safeString(map['title'], 'title'),
      type: safeString(map['type'], 'type'),
      imageUrl: safeString(map['image_full_url'], 'image_full_url'),
    );
  }
}

extension BannerModelEx on HomeBannerModel {
  HomeBannerEntity toEntity() {
    return HomeBannerEntity(
      id: id,
      title: title,
      type: type,
      imageUrl: imageUrl,
    );
  }
}
