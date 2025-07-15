import 'package:auracast/home/home_index.dart';
import 'package:lottie/lottie.dart';

class WeatherDisplayWidget extends StatelessWidget {
  final WeatherApiResponse? weatherApiResponse;
  final WeatherType? weatherType;

  const WeatherDisplayWidget({
    super.key,
    required this.weatherApiResponse,
    required this.weatherType,
  });

  double temperatureConverter(double kelvin) {
    return kelvin - 273.15;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (weatherApiResponse == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final List<Map<String, String>> weatherDetails = [
      {
        "title": "Feels like",
        "subtitle":
            "${temperatureConverter(weatherApiResponse!.main!.feelsLike!).toStringAsFixed(0)}°"
      },
      {
        "title": "Humidity",
        "subtitle": weatherApiResponse!.main!.humidity!.toStringAsFixed(0)
      },
      {
        "title": "Min Temp.",
        "subtitle":
            "${temperatureConverter(weatherApiResponse!.main!.tempMin!).toStringAsFixed(0)}°"
      },
      {
        "title": "Max Temp.",
        "subtitle":
            "${temperatureConverter(weatherApiResponse!.main!.tempMax!).toStringAsFixed(0)}°"
      },
      {
        "title": "Pressure",
        "subtitle": weatherApiResponse!.main!.pressure!.toString()
      },
      {
        "title": "Ground Level",
        "subtitle": weatherApiResponse!.main!.grndLevel!.toString()
      },
    ];

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
                      // GestureDetector(
                      //   onTap: updateCurrentCity,
                      //   child: Container(
                      //     decoration: const BoxDecoration(),
                      //     child: Icon(Icons.edit_location_alt_outlined,
                      //         color: Theme.of(context).scaffoldBackgroundColor,
                      //         size: 30),
                      //   ),
                      // ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Lottie.asset(
                              'assets/animations/${weatherType?.name.toLowerCase() ?? WeatherType.clear.name}.json'))
                    ]),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Expanded(
              child: ListView.builder(
                itemCount: weatherDetails.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GlassDetailsContainer(
                            title: weatherDetails[index]['title'] ?? "",
                            subtitle: weatherDetails[index]['subtitle']!,
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
