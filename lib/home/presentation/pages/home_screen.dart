import 'package:advanceweatherapp/home/home_index.dart';

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
    BlocProvider.of<HomeScreenBloc>(context)
        .add(FetchWeather(params: cityName));
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
            print("Weather of $cityName is => ${state.weatherApiResponse}");
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
