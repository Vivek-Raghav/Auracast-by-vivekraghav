import 'package:auracast/home/home_index.dart';

class WeatherDisplayWidget extends StatelessWidget {
  final WeatherApiResponse? weatherApiResponse;
  final WeatherType? weatherType;

  const WeatherDisplayWidget(
      {super.key, required this.weatherApiResponse, required this.weatherType});

  double temperatureConverter(double kelvin) {
    return kelvin - 273.15;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (weatherApiResponse == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  height: size.height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadlineSmallTextWidget(
                        text: weatherApiResponse!.name!,
                        color: ThemeColors.clrWhite,
                      ),
                      HeadlineSmallTextWidget(
                        text:
                            "${temperatureConverter(weatherApiResponse!.main!.temp!).toStringAsFixed(0)}°",
                        fontSize: 80,
                        color: ThemeColors.clrWhite,
                      ),
                      TitleMediumTextWidget(
                        text: weatherApiResponse!.weather![0].main!,
                        color: const Color.fromARGB(255, 199, 193, 193),
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child:
                              getWeatherIcon(weatherType ?? WeatherType.clear)
                                  .image())
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
