// Package imports:
import 'dart:convert';
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

  // New methods for complex data
  Future<void> setStringList(String key, List<String> value) async {
    await storage.setStringList(key, value);
  }

  Future<List<String>> getStringList(String key) async {
    return storage.getStringList(key) ?? [];
  }

  Future<void> setMap(String key, Map<String, dynamic> value) async {
    await storage.setString(key, jsonEncode(value));
  }

  Future<Map<String, dynamic>?> getMap(String key) async {
    final data = storage.getString(key);
    if (data != null) {
      return jsonDecode(data) as Map<String, dynamic>;
    }
    return null;
  }

  Future<void> clearAllStorage() async {
    await storage.clear();
  }
}
