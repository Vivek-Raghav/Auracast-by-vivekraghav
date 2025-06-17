import 'package:auracast/home/home_index.dart';

class WeatherDataPages extends StatelessWidget {
  const WeatherDataPages({
    required this.weatherApiResponse, super.key});
  final WeatherApiResponse weatherApiResponse;

  @override
  Widget build(BuildContext context) {
    final weatherType = parseWeatherType(weatherApiResponse.weather?[0].main);
    return Stack(children: [
      WeatherBasedBackground(weatherType: weatherType),
      WeatherDisplayWidget(
        weatherApiResponse: weatherApiResponse,
        weatherType: weatherType,
      ),
    ]);
  }
}
