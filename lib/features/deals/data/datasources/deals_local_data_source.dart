import 'package:crispy_bacon_flutter_deals_app/features/deals/data/models/deal_model.dart';

abstract class DealsLocalDataSource {
  Future<void> cacheDeals(List<DealModel> deals);
  Future<List<DealModel>> getCachedDeals();
  Future<void> clearDeals();
  Future<void> likeDeal(String dealId);
  Future<bool> isDealLiked(String dealId);
}
