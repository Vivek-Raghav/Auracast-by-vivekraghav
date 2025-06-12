import 'package:auracast/home/home_index.dart';

// BlocProvider creation with correct event dispatching
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> currentCity = [];
  final homeBloc = getIt<HomeScreenBloc>();

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  void fetchWeather() {
    final currentState = homeBloc.state;
    if (currentState is WeatherLoaded) {
      if (currentState.weatherApiResponse.isEmpty) {
        homeBloc.add(FetchWeather(params: "Delhi"));
      } else {
        if (kDebugMode) {
          print(
              "Data already exists: ${currentState.weatherApiResponse[0].weather?[0].main}");
        }
      }
    } else {
      homeBloc.add(FetchWeather(params: "Delhi"));
    }
  }

  Future<void> _searchCity() async {
    final selectedCity = await context.push<String>(AppRoutes.citySearch);
    if (selectedCity != null) {
      if (currentCity.contains(selectedCity)) {
        return;
      } else {
        currentCity.add(selectedCity);
        homeBloc.add(FetchWeather(params: selectedCity));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GlassSearchBar(onTap: _searchCity),
        actions: [
          GestureDetector(
            onTap: () => fetchWeather(),
            child: const Icon(Icons.refresh,
                size: 34, color: ThemeColors.clrWhite),
          ),
        ],
      ),
      body: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return PageView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: state.weatherApiResponse.length,
                itemBuilder: (context, index) {
                  final weather = parseWeatherType(
                      state.weatherApiResponse[index].weather?[0].main);
                  return Stack(children: [
                    WeatherBasedBackground(weatherType: weather),
                    WeatherDisplayWidget(
                        weatherApiResponse: state.weatherApiResponse[index]),
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
}
