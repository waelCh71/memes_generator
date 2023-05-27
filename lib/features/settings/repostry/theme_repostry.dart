import '../data/local_data_sources.dart';

class ThemeRepostry {
  final UseThemePreferance localy;

  ThemeRepostry(this.localy);
  Future<bool> getTheme() async {
    try {
      final boolTheme = localy.getTheme();
      return boolTheme;
    } catch (e) {
      return false;
    }
  }

  void setTheme(bool theme) {
    localy.setTheme(theme);
  }
}
