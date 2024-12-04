import 'package:advanceweatherapp/blocs/blocubit/home_screen_bloc.dart';
import 'package:advanceweatherapp/blocs/event/home_screen_event.dart';
import 'package:advanceweatherapp/blocs/state/home_screen_state.dart';
import 'package:advanceweatherapp/data/models/weather_api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advanceweatherapp/gen/assets.gen.dart';

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
    if (weatherApiResponse == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        BlocProvider.of<HomeScreenBloc>(context)
            .add(FetchWeather(params: cityName));
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            weatherApiResponse = state.weatherApiResponse;
            print(state.weatherApiResponse);
          } else if (state is WeatherError) {
            return Center(child: Text('Error: ${state.message}'));
          }
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
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
