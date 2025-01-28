import 'dart:io';
import 'package:crispy_bacon_flutter_deals_app/infrastructure/database/tables/deals_table.dart';
import 'package:crispy_bacon_flutter_deals_app/infrastructure/database/tables/liked_deal_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables/settings_table.dart';

part 'app_database.g.dart';

@LazySingleton()
@DriftDatabase(tables: [Settings, Deals, LikedDeals])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}
