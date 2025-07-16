import 'package:auracast/home/home_index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
          if (state is WeatherLoaded) {
          } else if (state is WeatherError) {
            showToast(title: "Text('Error: ${state.message}");
          }
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Assets.images.bgSearchCity.provider())),
                child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 5)));
          } else if (state is WeatherLoaded) {
            return WeatherDataPages(
                weatherApiResponse:
                    state.weatherApiResponse[state.currentWeatherIndex]);
          } else if (state is WeatherError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
