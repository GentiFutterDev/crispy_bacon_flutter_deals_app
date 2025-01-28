import 'package:crispy_bacon_flutter_deals_app/features/deals/data/datasources/deals_local_data_source.dart';
import 'package:crispy_bacon_flutter_deals_app/features/deals/data/models/deal_model.dart';
import 'package:crispy_bacon_flutter_deals_app/infrastructure/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DealsLocalDataSource)
class DealsLocalDataSourceImpl implements DealsLocalDataSource {
  final AppDatabase database;

  DealsLocalDataSourceImpl(this.database);

  @override
  Future<void> cacheDeals(List<DealModel> deals) async {

    final dealCompanions = deals.map((deal) {

      final releaseDate = deal.rawReleaseDate != null
      ? deal.rawReleaseDate!.millisecondsSinceEpoch ~/ 1000
      : null;

      final companion = DealsCompanion(
        id: Value(deal.rawDealID),
        title: Value(deal.rawTitle),
        price: Value(deal.rawSalePrice),
        thumbnail: Value(deal.rawThumbnail),
        rating: Value(deal.rawRating),
        releaseDate: Value(releaseDate),
        metacriticLink: Value(deal.rawMetacriticLink),
      );
      return companion;
    }).toList();

    try {
      await database.batch((batch) {
        batch.insertAllOnConflictUpdate(database.deals, dealCompanions);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DealModel>> getCachedDeals() async {
    final results = await database.select(database.deals).get();
    return results.map((row) {
      return DealModel(
        rawDealID: row.id,
        rawTitle: row.title,
        rawSalePrice: row.price,
        rawThumbnail: row.thumbnail,
        rawRating: row.rating,
        rawReleaseDate: row.releaseDate != null
            ? DateTime.fromMillisecondsSinceEpoch(row.releaseDate! * 1000)
            : null,
        rawMetacriticLink: row.metacriticLink,
      );
    }).toList();
  }

  @override
  Future<void> clearDeals() async {
    await database.delete(database.deals).go();
  }

  @override
  Future<void> likeDeal(String dealId) async {
    try {
      await database.into(database.likedDeals).insertOnConflictUpdate(
        LikedDealsCompanion(
          dealId: Value(dealId),
          isLiked: Value(true),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isDealLiked(String dealId) async {
    try {
      final result = await (database.select(database.likedDeals)
            ..where((tbl) => tbl.dealId.equals(dealId)))
          .getSingleOrNull();
      return result?.isLiked ?? false;
    } catch (e) {
      rethrow;
    }
  }
}
