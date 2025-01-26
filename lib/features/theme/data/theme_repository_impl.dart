import 'package:crispy_bacon_flutter_deals_app/features/theme/domain/theme_repository.dart';
import 'package:crispy_bacon_flutter_deals_app/infrastructure/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final AppDatabase _database;

  static const String _themeKey = 'selected_theme';

  ThemeRepositoryImpl(this._database);

  @override
  Future<String> getSavedTheme() async {
    final query = await (_database.select(_database.settings)
      ..where((tbl) => tbl.key.equals(_themeKey)))
        .getSingleOrNull();

    return query?.value ?? 'light';
  }

  @override
  Future<void> saveTheme(String theme) async {
    await _database
        .into(_database.settings)
        .insertOnConflictUpdate(SettingsCompanion(
          key: Value(_themeKey),
          value: Value(theme),
        ));
  }
}
