import 'package:advanceweatherapp/blocs/blocubit/home_screen_bloc.dart';
import 'package:advanceweatherapp/data/repository/weather_api_respository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_screen.dart';
import 'package:advanceweatherapp/data/domain/usecase/weather_api_uc.dart';
import 'package:advanceweatherapp/data/datasource/weather_api_datasource_impl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(
        WeatherApiResponseUc(
          weatherApiRespository: WeatherApiRespositoryImpl(
            weatherApiDatasource: WeatherApiDatasourceImpl(),
          ),
        ),
      ),
      child: const HomeScreen(),
    );
  }
}
