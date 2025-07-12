import 'dart:ui';

import 'package:auracast/home/home_index.dart';

class WeatherDisplayWidget extends StatelessWidget {
  final WeatherApiResponse? weatherApiResponse;
  final WeatherType? weatherType;
  final VoidCallback updateCurrentCity;

  const WeatherDisplayWidget(
      {super.key,
      required this.weatherApiResponse,
      required this.weatherType,
      required this.updateCurrentCity});

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
                      GestureDetector(
                        onTap: updateCurrentCity,
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Icon(Icons.edit_location_alt_outlined,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              size: 30),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child:
                              getWeatherIcon(weatherType ?? WeatherType.clear)
                                  .image())
                    ]),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GlassDetailsContainer(
                            title: "Feels like",
                            subtitle:
                                "${temperatureConverter(weatherApiResponse!.main!.feelsLike!).toStringAsFixed(0)}°"),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: GlassDetailsContainer(
                            title: "Humidity",
                            subtitle:
                                "${weatherApiResponse!.main!.humidity!.toStringAsFixed(0)}%"),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GlassDetailsContainer(
                            title: "Min Temp.",
                            subtitle:
                                "${temperatureConverter(weatherApiResponse!.main!.tempMin!).toStringAsFixed(0)}°"),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: GlassDetailsContainer(
                            title: "Max Temp.",
                            subtitle:
                                "${temperatureConverter(weatherApiResponse!.main!.tempMax!).toStringAsFixed(0)}°"),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GlassDetailsContainer(
                            title: "Pressure",
                            subtitle:
                                weatherApiResponse!.main!.pressure!.toString()),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: GlassDetailsContainer(
                            title: "Ground Level",
                            subtitle: weatherApiResponse!.main!.grndLevel!
                                .toString()),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GlassDetailsContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const GlassDetailsContainer(
      {required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          HeadlineSmallTextWidget(
            text: title,
            color: ThemeColors.clrWhite,
          ),
          HeadlineSmallTextWidget(
            text: subtitle,
            color: ThemeColors.clrWhite,
          ),
        ],
      ),
    );
  }
}
