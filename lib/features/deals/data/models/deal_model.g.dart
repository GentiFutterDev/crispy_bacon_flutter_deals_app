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
    );

Map<String, dynamic> _$DealModelToJson(DealModel instance) => <String, dynamic>{
      'dealID': instance.rawDealID,
      'title': instance.rawTitle,
      'salePrice': DealModel._salePriceToJson(instance.rawSalePrice),
      'thumb': instance.rawThumbnail,
    };
