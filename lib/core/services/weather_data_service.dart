import 'package:auracast/core/local_db/local_cache.dart';
import 'package:auracast/core/local_db/prefs_key.dart';
import 'package:auracast/home/models/weather_api_response.dart';

class WeatherDataService {
  final LocalCache _localCache;

  WeatherDataService(this._localCache);

  // Save the list of saved cities
  Future<void> saveSavedCities(List<String> cities) async {
    await _localCache.setStringList(PrefsKey.savedCities, cities);
  }

  // Load the list of saved cities
  Future<List<String>> loadSavedCities() async {
    return await _localCache.getStringList(PrefsKey.savedCities);
  }

  // Save weather data for all cities
  Future<void> saveWeatherData(List<WeatherApiResponse> weatherData) async {
    final List<Map<String, dynamic>> dataList =
        weatherData.map((weather) => weather.toJson()).toList();

    await _localCache.setMap(PrefsKey.weatherData, {
      'data': dataList,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  // Load weather data for all cities
  Future<List<WeatherApiResponse>> loadWeatherData() async {
    final data = await _localCache.getMap(PrefsKey.weatherData);
    if (data != null && data['data'] != null) {
      final List<dynamic> dataList = data['data'] as List<dynamic>;
      return dataList
          .map((item) =>
              WeatherApiResponse.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  // Check if cached data is still valid (e.g., less than 30 minutes old)
  Future<bool> isCachedDataValid() async {
    final data = await _localCache.getMap(PrefsKey.weatherData);
    if (data != null && data['timestamp'] != null) {
      final timestamp = data['timestamp'] as int;
      final lastUpdated = DateTime.fromMillisecondsSinceEpoch(timestamp);
      final now = DateTime.now();
      final difference = now.difference(lastUpdated);
      return difference.inMinutes < 30; // Cache valid for 30 minutes
    }
    return false;
  }

  // Save default city
  Future<void> saveDefaultCity(String city) async {
    await _localCache.setString(PrefsKey.defaultCity, city);
  }

  // Load default city
  Future<String> loadDefaultCity() async {
    return await _localCache.getString(PrefsKey.defaultCity) ?? "Delhi";
  }
}
