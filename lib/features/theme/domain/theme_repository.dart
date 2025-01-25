abstract class ThemeRepository {
  Future<String> getSavedTheme();
  Future<void> saveTheme(String theme);
}
