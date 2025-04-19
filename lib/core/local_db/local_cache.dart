import 'package:shared_preferences/shared_preferences.dart';

class LocalCache {
  late final SharedPreferences storage;

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await storage.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return storage.getString(key);
  }

  Future<void> setBool(String key, bool value) async =>
      await storage.setBool(key, value);

  Future<bool> getBool(String key) async => storage.getBool(key) ?? false;

  Future<void> clearAllStorage() async {
    await storage.clear();
  }
}
