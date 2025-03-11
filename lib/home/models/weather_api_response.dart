// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'weather_api_response.g.dart';

@JsonSerializable()
class WeatherApiResponse {
  WeatherApiResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  factory WeatherApiResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherApiResponseToJson(this);

  @override
  String toString() {
    return "$coord, $weather, $base, $main, $visibility, $wind, $clouds, $dt, $sys, $timezone, $id, $name, $cod, ";
  }
}

@JsonSerializable()
class Clouds {
  Clouds({
    required this.all,
  });

  final int? all;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);

  @override
  String toString() {
    return "$all, ";
  }
}

@JsonSerializable()
class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  final double? lon;
  final double? lat;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);

  @override
  String toString() {
    return "$lon, $lat, ";
  }
}

@JsonSerializable()
class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  final double? temp;

  @JsonKey(name: 'feels_like')
  final double? feelsLike;

  @JsonKey(name: 'temp_min')
  final double? tempMin;

  @JsonKey(name: 'temp_max')
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  @JsonKey(name: 'sea_level')
  final int? seaLevel;

  @JsonKey(name: 'grnd_level')
  final int? grndLevel;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);

  @override
  String toString() {
    return "$temp, $feelsLike, $tempMin, $tempMax, $pressure, $humidity, $seaLevel, $grndLevel, ";
  }
}

@JsonSerializable()
class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);

  @override
  String toString() {
    return "$type, $id, $country, $sunrise, $sunset, ";
  }
}

@JsonSerializable()
class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  String toString() {
    return "$id, $main, $description, $icon, ";
  }
}

@JsonSerializable()
class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });

  final double? speed;
  final int? deg;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);

  @override
  String toString() {
    return "$speed, $deg, ";
  }
}
