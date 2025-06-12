// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:auracast/core/shared/utils/generic_enums.dart';
import 'package:auracast/gen/assets.gen.dart';
import 'package:auracast/home/presentation/widgets/weather_image_provider.dart';

class WeatherBasedBackground extends StatelessWidget {
  const WeatherBasedBackground({required this.weatherType, super.key});
  final WeatherType? weatherType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Stack(
          children: [
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  image: getWeatherAsset(weatherType ?? WeatherType.clear)
                      .provider(),
                  fit: BoxFit.cover),
            )),
            Container(color: Colors.black.withOpacity(0.5))
          ],
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Assets.images.house.provider(),
                      fit: BoxFit.contain)))
        ]),
        SizedBox(
          height: double.infinity,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              color: Colors.black.withAlpha(1),
            ),
          ),
        ),
        SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: getWeatherIcon(weatherType ?? WeatherType.clear)
                        .image())
              ]),
        ),
      ],
    );
  }
}
