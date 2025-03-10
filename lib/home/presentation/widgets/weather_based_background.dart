import 'dart:ui';

import 'package:auracast/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class WeatherBasedBackground extends StatelessWidget {
  const WeatherBasedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.homeBackground.provider(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            Container(height: MediaQuery.of(context).size.height * 0.3),
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: Assets.images.house.provider(),
                  fit: BoxFit.contain,
                )))
          ],
        ),
        SizedBox(
          height: double.infinity,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withAlpha(1),
            ),
          ),
        ),
      ],
    );
  }
}
