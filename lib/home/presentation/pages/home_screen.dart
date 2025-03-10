import 'dart:ui';

import 'package:auracast/core/shared/widgets/common_text_widgets.dart';
import 'package:auracast/home/home_index.dart';
import 'package:auracast/home/presentation/widgets/weather_based_background.dart';
import 'package:flutter/foundation.dart';

// BlocProvider creation with correct event dispatching
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String cityName = "Delhi";
  WeatherApiResponse? weatherApiResponse;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  void fetchWeather() {
    if (weatherApiResponse == null) {
      context.read<HomeScreenBloc>().add(FetchWeather(params: cityName));
    } else {
      if (kDebugMode) {
        print("Data already fetched for $cityName");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            weatherApiResponse = state.weatherApiResponse;
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   _showCustomModalBottomSheet(context);
            // });
            return Stack(children: [
              const WeatherBasedBackground(),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.1, width: double.infinity),
                    Container(
                        decoration: const BoxDecoration(),
                        height: size.height * 0.3,
                        child: Column(children: [
                          HeadlineSmallTextWidget(
                              text: state.weatherApiResponse.name!,
                              color: ThemeColors.clrWhite),
                          HeadlineSmallTextWidget(
                              text:
                                  "${temperatureConverter(state.weatherApiResponse.main!.temp!).toStringAsFixed(0)}°",
                              fontSize: 80,
                              color: ThemeColors.clrWhite),
                          TitleMediumTextWidget(
                              text: state.weatherApiResponse.weather![0].main!,
                              color: const Color.fromARGB(255, 199, 193, 193),
                              fontWeight: FontWeight.w600),
                        ])),
                  ])
            ]);
          } else if (state is WeatherError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }

  double temperatureConverter(double kelvin) {
    return kelvin - 273.15;
  }

  void _showCustomModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text("Your Content Here"),
            ),
          ),
        );
      },
    );
  }
}
