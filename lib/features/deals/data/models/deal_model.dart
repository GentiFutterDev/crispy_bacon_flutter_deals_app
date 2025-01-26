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

  @JsonKey(name: 'steamRatingPercent', fromJson: _ratingFromJson, toJson: _ratingToJson)
  final double? rawRating;

  @JsonKey(name: 'releaseDate', fromJson: _releaseDateFromJson, toJson: _releaseDateToJson)
  final DateTime? rawReleaseDate;

  @JsonKey(name: 'metacriticLink')
  final String? rawMetacriticLink;

  DealModel({
    required this.rawDealID,
    required this.rawTitle,
    required this.rawSalePrice,
    this.rawThumbnail,
    this.rawRating,
    this.rawReleaseDate,
    this.rawMetacriticLink,
  }) : super(
          id: rawDealID,
          title: rawTitle,
          price: rawSalePrice,
          thumbnail: rawThumbnail,
          rating: rawRating,
          releaseDate: rawReleaseDate,
          metacriticLink: rawMetacriticLink,
        );

  static double _salePriceFromJson(String salePrice) => double.parse(salePrice);
  static String _salePriceToJson(double salePrice) => salePrice.toString();

  static double? _ratingFromJson(String? rating) =>
      rating != null ? double.tryParse(rating) : null;
  static String? _ratingToJson(double? rating) => rating?.toString();

  static DateTime? _releaseDateFromJson(int? timestamp) =>
      (timestamp != null && timestamp > 0)
          ? DateTime.fromMillisecondsSinceEpoch(timestamp * 1000)
          : null;
  static int? _releaseDateToJson(DateTime? date) =>
      date != null ? (date.millisecondsSinceEpoch ~/ 1000) : null;

  factory DealModel.fromJson(Map<String, dynamic> json) =>
      _$DealModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealModelToJson(this);
}
