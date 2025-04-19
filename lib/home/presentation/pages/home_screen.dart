// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:auracast/home/presentation/widgets/weather_image_provider.dart';
import 'package:auracast/injection_container/injected/inject_blocs.dart';
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:auracast/home/home_index.dart';
import 'package:auracast/home/presentation/widgets/weather_based_background.dart';
import 'package:auracast/home/presentation/widgets/weather_display_widget.dart';

// BlocProvider creation with correct event dispatching
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String cityName = "Delhi";
  final homeBloc = getIt<HomeScreenBloc>();

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  void fetchWeather() {
    debugPrint("Fetching weather for $cityName");
    final currentState = homeBloc.state;
    if (currentState is WeatherLoaded) {
      if (currentState.weatherApiResponse.isEmpty) {
        homeBloc.add(FetchWeather(params: cityName));
      } else {
        if (kDebugMode) {
          print(
              "Data already exists: ${currentState.weatherApiResponse[0].weather?[0].main}");
        }
      }
    } else {
      homeBloc.add(FetchWeather(params: cityName));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
              onTap: () => fetchWeather(),
              child: const Icon(Icons.refresh,
                  size: 34, color: ThemeColors.clrWhite)),
        ],
      ),
      body: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          } else if (state is WeatherLoaded) {
            final WeatherType = state.weatherApiResponse[0].weather?[0].main;
          }
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return PageView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  final weather = parseWeatherType(
                      state.weatherApiResponse[0].weather?[0].main);
                  return Stack(children: [
                    WeatherBasedBackground(weatherType: weather),
                    WeatherDisplayWidget(
                        weatherApiResponse: state.weatherApiResponse[0]),
                  ]);
                });
          } else if (state is WeatherError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
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
            child: const Center(
              child: Text("Your Content Here"),
            ),
          ),
        );
      },
    );
  }
}
