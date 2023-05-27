import 'package:shared_preferences/shared_preferences.dart';

import '../../../global/utils/constants.dart';

class UseThemePreferance {
  final SharedPreferences preferences;

  UseThemePreferance({required this.preferences});

  Future setTheme(bool boolTheme) async {
    await preferences.setBool(userKey, boolTheme);
  }

  bool getTheme() => preferences.getBool(userKey)!;
}
