import 'package:auracast/core/local_db/local_cache.dart';
import 'package:auracast/core/local_db/prefs_key.dart';
import 'package:auracast/home/home_index.dart';
import 'package:auracast/home/presentation/widgets/dot_indicator.dart';

// BlocProvider creation with correct event dispatching
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> currentCity = [];
  int _currentIndex = 0;
  final homeBloc = getIt<HomeScreenBloc>();
  final _pageController = PageController();
  final _localCache = getIt<LocalCache>();
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    fetchWeather();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page?.round() ?? 0;
      });
    });
  }

  void fetchWeather() async {
    final currentState = homeBloc.state;
    if (currentState is WeatherLoaded) {
      if (currentState.weatherApiResponse.isEmpty) {
        final citName =
            await _localCache.getString(PrefsKey.defaultCity) ?? "Delhi";
        homeBloc.add(FetchWeather(params: citName));
        currentCity.add(citName);
      } else {
        if (kDebugMode) {
          print(
              "Data already exists: ${currentState.weatherApiResponse[0].weather?[0].main}");
        }
      }
    } else {
      homeBloc.add(FetchWeather(params: "Delhi"));
      currentCity.add("Delhi");
    }
  }

  Future<void> _searchCity() async {
    _isUpdating = false;
    final selectedCity = await context.push<String>(AppRoutes.citySearch);
    if (selectedCity != null) {
      if (currentCity.contains(selectedCity)) {
        showToast(title: "$selectedCity is already added");
        return;
      } else {
        currentCity.add(selectedCity);
        homeBloc.add(FetchWeather(params: selectedCity));
      }
    }
  }

  Future<void> _updateCity(int index) async {
    _isUpdating = true;
    final selectedCity = await context.push<String>(AppRoutes.citySearch);
    if (selectedCity != null) {
      if (currentCity.contains(selectedCity)) {
        showToast(title: "$selectedCity is already added");
        return;
      } else {
        currentCity[index] = selectedCity;
        homeBloc.add(UpdateWeather(params: selectedCity, index: index));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: currentCity.length > 1 ? 100 : null,
          elevation: 0,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GlassSearchBar(onTap: _searchCity),
                  ),
                  const SizedBox(width: 12), // optional spacing
                  GestureDetector(
                    onTap: fetchWeather,
                    child: const Icon(Icons.refresh,
                        size: 34, color: ThemeColors.clrWhite),
                  ),
                ],
              ),
              SizedBox(height: currentCity.length > 1 ? 10 : 0),
              if (currentCity.length > 1)
                DotIndicator(
                    length: currentCity.length, currentIndex: _currentIndex)
            ],
          )),
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
            return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Assets.images.bgSearchCity.provider())),
                child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 5)));
          } else if (state is WeatherLoaded) {
            return PageView.builder(
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
                itemCount: state.weatherApiResponse.length,
                itemBuilder: (context, index) {
                  return WeatherDataPages(
                      weatherApiResponse: state.weatherApiResponse[index],
                      updateCurrentCity: () {
                        _updateCity(index);
                      });
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
