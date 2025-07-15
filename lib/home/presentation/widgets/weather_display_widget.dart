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
            "${temperatureConverter(weatherApiResponse!.main!.feelsLike!).toStringAsFixed(0)}°",
        "image": "assets/icons/forecast/feels_like.svg"
      },
      {
        "title": "Humidity",
        "subtitle":
            " ${weatherApiResponse!.main!.humidity!.toStringAsFixed(0)}%",
        "image": "assets/icons/forecast/humidity.svg"
      },
      {
        "title": "Min Temp.",
        "subtitle":
            "${temperatureConverter(weatherApiResponse!.main!.tempMin!).toStringAsFixed(0)}°",
        "image": "assets/icons/forecast/min_temp.svg"
      },
      {
        "title": "Max Temp.",
        "subtitle":
            "${temperatureConverter(weatherApiResponse!.main!.tempMax!).toStringAsFixed(0)}°",
        "image": "assets/icons/forecast/max_temp.svg"
      },
      {
        "title": "Pressure",
        "subtitle": weatherApiResponse!.main!.pressure!.toString(),
        "image": "assets/icons/forecast/pressure.svg"
      },
      {
        "title": "Ground Level",
        "subtitle": weatherApiResponse!.main!.grndLevel!.toString(),
        "image": "assets/icons/forecast/ground_level.svg"
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.sh,
            TextWidget(
              text: weatherApiResponse!.name!,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w600, color: ThemeColors.clrWhite),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: size.height * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadlineSmallTextWidget(
                          text:
                              "${temperatureConverter(weatherApiResponse!.main!.temp!).toStringAsFixed(0)}°",
                          fontSize: 70,
                          color: ThemeColors.clrWhite,
                        ),
                        TitleMediumTextWidget(
                            text: weatherApiResponse!.weather![0].main!,
                            color: ThemeColors.clrWhite,
                            fontWeight: FontWeight.w600),
                        TextWidget(
                            text:
                                'H:${temperatureConverter(weatherApiResponse!.main!.tempMax!).toStringAsFixed(0)}°  L:${temperatureConverter(weatherApiResponse!.main!.tempMin!).toStringAsFixed(0)}°',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white70)),
                      ],
                    ),
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Lottie.asset(
                              'assets/animations/${weatherType?.name.toLowerCase() ?? WeatherType.clear.name}.json'))
                    ]),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            TextWidget(
              text: "Forecast Details",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ThemeColors.clrWhite, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: weatherDetails.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GlassDetailsContainer(
                          title: weatherDetails[index]['title'] ?? "",
                          subtitle: weatherDetails[index]['subtitle'] ?? "",
                          image: weatherDetails[index]['image'],
                        ),
                      ),
                    ],
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
  final String? image;
  const GlassDetailsContainer(
      {required this.title,
      required this.image,
      required this.subtitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
                width: 0.4,
                color: Theme.of(context)
                    .scaffoldBackgroundColor
                    .withOpacity(0.9))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      text: title,
                      color: ThemeColors.clrWhite,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ThemeColors.clrWhite)),
                  if (image != null)
                    SvgPicture.asset(image!, height: 30, width: 30),
                ]),
          ),
          Expanded(
            flex: 2,
            child: TextWidget(
                text: subtitle,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500, color: ThemeColors.clrWhite)),
          ),
        ],
      ),
    );
  }
}
