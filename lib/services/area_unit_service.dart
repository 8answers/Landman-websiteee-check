import 'package:shared_preferences/shared_preferences.dart';

class AreaUnitService {
  static const String _prefix = 'project_';
  static const String _suffix = '_area_unit';
  static const String defaultUnit = 'Square Meter (sqm)';

  static String _key(String? projectId) =>
      '${_prefix}${projectId ?? 'default'}$_suffix';

  static Future<String> getAreaUnit(String? projectId) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getString(_key(projectId));
    if (current != defaultUnit) {
      await prefs.setString(_key(projectId), defaultUnit);
    }
    return defaultUnit;
  }

  static Future<void> setAreaUnit(String? projectId, String unit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key(projectId), defaultUnit);
  }
}
