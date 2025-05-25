// Function to map WeatherType to asset paths

// Project imports:
import 'package:auracast/core/shared/utils/generic_enums.dart';
import 'package:auracast/gen/assets.gen.dart';

AssetGenImage getWeatherAsset(WeatherType weatherType) {
  switch (weatherType) {
    case WeatherType.clear:
      return Assets.weathertype.clear;
    case WeatherType.clouds:
      return Assets.weathertype.clouds;
    case WeatherType.rain:
      return Assets.weathertype.rain;
    case WeatherType.drizzle:
      return Assets.weathertype.drizzle;
    case WeatherType.snow:
      return Assets.weathertype.snow;
    case WeatherType.thunderstorm:
      return Assets.weathertype.thunderstorm;
    case WeatherType.mist:
      return Assets.weathertype.mist;
    case WeatherType.smoke:
      return Assets.weathertype.smoke;
    case WeatherType.haze:
      return Assets.weathertype.haze;
    case WeatherType.dust:
      return Assets.weathertype.dust;
    case WeatherType.fog:
      return Assets.weathertype.fog;
    case WeatherType.sand:
      return Assets.weathertype.sand;
    case WeatherType.ash:
      return Assets.weathertype.ash;
    case WeatherType.squall:
      return Assets.weathertype.squall;
    case WeatherType.tornado:
      return Assets.weathertype.tornado;
  }
}

AssetGenImage getWeatherIcon(WeatherType weatherType) {
  switch (weatherType) {
    case WeatherType.clear:
      return Assets.icons.weather.clear;
    case WeatherType.clouds:
      return Assets.icons.weather.clouds;
    case WeatherType.rain:
      return Assets.icons.weather.rain;
    case WeatherType.drizzle:
      return Assets.icons.weather.drizzle;
    case WeatherType.snow:
      return Assets.icons.weather.snow;
    case WeatherType.thunderstorm:
      return Assets.icons.weather.thunderstorm;
    case WeatherType.mist:
      return Assets.icons.weather.mist;
    case WeatherType.smoke:
      return Assets.icons.weather.smoke;
    case WeatherType.haze:
      return Assets.icons.weather.haze;
    case WeatherType.dust:
      return Assets.icons.weather.dust;
    case WeatherType.fog:
      return Assets.icons.weather.fog;
    case WeatherType.sand:
      return Assets.icons.weather.sand;
    case WeatherType.ash:
      return Assets.icons.weather.ash;
    case WeatherType.squall:
      return Assets.icons.weather.squall;
    case WeatherType.tornado:
      return Assets.icons.weather.tornado;
  }
}

WeatherType parseWeatherType(String? main) {
  if (main == null) return WeatherType.clear;

  switch (main.toLowerCase()) {
    case 'thunderstorm':
      return WeatherType.thunderstorm;
    case 'drizzle':
      return WeatherType.drizzle;
    case 'rain':
      return WeatherType.rain;
    case 'snow':
      return WeatherType.snow;
    case 'mist':
      return WeatherType.mist;
    case 'smoke':
      return WeatherType.smoke;
    case 'haze':
      return WeatherType.haze;
    case 'dust':
      return WeatherType.dust;
    case 'fog':
      return WeatherType.fog;
    case 'sand':
      return WeatherType.sand;
    case 'ash':
      return WeatherType.ash;
    case 'squall':
      return WeatherType.squall;
    case 'tornado':
      return WeatherType.tornado;
    case 'clear':
      return WeatherType.clear;
    case 'clouds':
      return WeatherType.clouds;
    default:
      return WeatherType.clear;
  }
}
