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
  final _pageController = PageController();
  final _localCache = getIt<LocalCache>();
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void fetchWeather() async {
    final currentState = homeBloc.state;
    final citName =
        await _localCache.getString(PrefsKey.defaultCity) ?? "Delhi";
    if (currentState is WeatherLoaded) {
      if (currentState.weatherApiResponse.isEmpty) {
        homeBloc.add(FetchWeather(params: citName));
        currentCity.add(citName);
      } else {
        if (kDebugMode) {
          print(
              "Data already exists: ${currentState.weatherApiResponse[0].weather?[0].main}");
        }
      }
    } else {
      homeBloc.add(FetchWeather(params: citName));
      currentCity.add(citName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
          if (state is WeatherLoaded) {
            //
            // Using WidgetsBinding to safely get _pageController data first and navigate to screen
            //
            if (!_isUpdating) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!_pageController.hasClients) return;
                _pageController.animateToPage(
                    state.weatherApiResponse.length - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              });
            }
            //
            // Choose your fav curve
            //
          } else if (state is WeatherError) {
            showToast(title: "Text('Error: ${state.message}");
          }
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return currentCity.isNotEmpty
                ? const LinearProgressIndicator()
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Assets.images.bgSearchCity.provider())),
                    child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 5)));
          } else if (state is WeatherLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_pageController.hasClients &&
                  _pageController.page?.round() != state.currentWeatherIndex) {
                _pageController.jumpToPage(state.currentWeatherIndex);
              }
            });
            return PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.weatherApiResponse.length,
                itemBuilder: (context, index) {
                  return WeatherDataPages(
                      weatherApiResponse: state.weatherApiResponse[index]);
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
