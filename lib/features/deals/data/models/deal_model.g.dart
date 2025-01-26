// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealModel _$DealModelFromJson(Map<String, dynamic> json) => DealModel(
      rawDealID: json['dealID'] as String,
      rawTitle: json['title'] as String,
      rawSalePrice: DealModel._salePriceFromJson(json['salePrice'] as String),
      rawThumbnail: json['thumb'] as String?,
      rawRating:
          DealModel._ratingFromJson(json['steamRatingPercent'] as String?),
      rawReleaseDate: DealModel._releaseDateFromJson(
          (json['releaseDate'] as num?)?.toInt()),
      rawMetacriticLink: json['metacriticLink'] as String?,
    );

Map<String, dynamic> _$DealModelToJson(DealModel instance) => <String, dynamic>{
      'dealID': instance.rawDealID,
      'title': instance.rawTitle,
      'salePrice': DealModel._salePriceToJson(instance.rawSalePrice),
      'thumb': instance.rawThumbnail,
      'steamRatingPercent': DealModel._ratingToJson(instance.rawRating),
      'releaseDate': DealModel._releaseDateToJson(instance.rawReleaseDate),
      'metacriticLink': instance.rawMetacriticLink,
    };
