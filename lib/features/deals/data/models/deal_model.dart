import 'package:crispy_bacon_flutter_deals_app/features/deals/domain/entities/deal_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deal_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DealModel extends Deal {
  @JsonKey(name: 'dealID')
  final String rawDealID;

  @JsonKey(name: 'title')
  final String rawTitle;

  @JsonKey(name: 'salePrice', fromJson: _salePriceFromJson, toJson: _salePriceToJson)
  final double rawSalePrice;

  @JsonKey(name: 'thumb')
  final String? rawThumbnail;

  DealModel({
    required this.rawDealID,
    required this.rawTitle,
    required this.rawSalePrice,
    this.rawThumbnail,
  }) : super(
          id: rawDealID,
          title: rawTitle,
          price: rawSalePrice,
          thumbnail: rawThumbnail,
        );

  // Custom JSON conversion for salePrice
  static double _salePriceFromJson(String salePrice) => double.parse(salePrice);
  static String _salePriceToJson(double salePrice) => salePrice.toString();

  factory DealModel.fromJson(Map<String, dynamic> json) =>
      _$DealModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealModelToJson(this);
}
