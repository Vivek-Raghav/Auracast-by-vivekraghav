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
      currentCity.add("Delhi");
    }
  }

  Future<void> _searchCity() async {
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
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!_pageController.hasClients) return;
              _pageController.animateToPage(state.weatherApiResponse.length - 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            });
            //
            // Choose your fav curve
            //
          } else if (state is WeatherError) {
            showToast(title: "Text('Error: ${state.message}");
          }
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return PageView.builder(
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
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
