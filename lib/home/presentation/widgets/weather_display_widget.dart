// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:auracast/core/shared/widgets/common_text_widgets.dart';
import 'package:auracast/core/theme/app_theme.dart';
import 'package:auracast/home/models/weather_api_response.dart';

class WeatherDisplayWidget extends StatelessWidget {
  final WeatherApiResponse? weatherApiResponse;

  const WeatherDisplayWidget({super.key, required this.weatherApiResponse});

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
          ],
        ),
      ),
    );
  }
}
