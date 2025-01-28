import 'package:drift/drift.dart';

class LikedDeals extends Table {
  TextColumn get dealId => text()();
  BoolColumn get isLiked => boolean()();

  @override
  Set<Column> get primaryKey => {dealId};
}
