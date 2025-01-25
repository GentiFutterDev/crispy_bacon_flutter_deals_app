import 'package:crispy_bacon_flutter_deals_app/features/theme/domain/theme_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ThemeRepository)
class HiveThemeRepository implements ThemeRepository {
  static const String _themeKey = 'selected_theme';
  final Box settingsBox;

  HiveThemeRepository(this.settingsBox);

  @override
  Future<String> getSavedTheme() async {
    return settingsBox.get(_themeKey, defaultValue: 'light') as String;
  }

  @override
  Future<void> saveTheme(String theme) async {
    await settingsBox.put(_themeKey, theme);
  }
}
