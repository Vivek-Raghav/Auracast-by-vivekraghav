import 'package:auracast/locations/location_index.dart';
import 'package:auracast/locations/widgets/glass_card.dart';

class UserSavedCities extends StatefulWidget {
  const UserSavedCities({super.key});

  @override
  State<UserSavedCities> createState() => _UserSavedCitiesState();
}

class _UserSavedCitiesState extends State<UserSavedCities> {
  final homeBloc = getIt<HomeScreenBloc>();
  final _localCache = getIt<LocalCache>();
  List<String> currentCity = [];

  @override
  void initState() {
    super.initState();
    _addDefaultCity();
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

  Future<void> _updateCity(int index) async {
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
    if (index == 0) {
      _localCache.setString(
          PrefsKey.defaultCity, selectedCity ?? currentCity[index]);
    }
  }

  void _addDefaultCity() async {
    final citName =
        await _localCache.getString(PrefsKey.defaultCity) ?? "Delhi";
    currentCity.add(citName);
  }

  void _changeCityToHomePage(int index) {
    homeBloc.add(ChangeCurrentWeatherIndex(index));
    context.push(AppRoutes.bottomNavigation);
  }

  String temperatureConverter(double kelvin) {
    return (kelvin - 273.15).toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home_background.png"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            50.sh,
            TextWidget(
              text: "Weather",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: ThemeColors.clrWhite, fontWeight: FontWeight.bold),
            ),
            10.sh,
            GlassSearchBar(onTap: _searchCity),
            20.sh,
            BlocConsumer(
              bloc: homeBloc,
              listener: (context, state) {},
              builder: (builder, state) {
                if (state is WeatherLoaded) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: state.weatherApiResponse.length,
                          itemBuilder: (context, index) {
                            final weather = state.weatherApiResponse[index];
                            return Stack(
                              children: [
                                GlassCard(
                                  location: weather.name ?? 'N/A',
                                  city: weather.sys?.country ?? 'N/A',
                                  condition:
                                      weather.weather?.first.description ??
                                          'N/A',
                                  temp:
                                      temperatureConverter(weather.main!.temp!),
                                  high: temperatureConverter(
                                      weather.main!.tempMax!),
                                  low: temperatureConverter(
                                      weather.main!.tempMin!),
                                  onTap: () => _changeCityToHomePage(index),
                                ),
                                Positioned(
                                    right: 40,
                                    top: -4,
                                    child: IconButton(
                                        onPressed: () {
                                          _updateCity(index);
                                        },
                                        icon: const Icon(
                                          size: 20,
                                          Icons.edit,
                                          color: ThemeColors.clrWhite,
                                        ))),
                                Positioned(
                                    right: 0,
                                    top: -4,
                                    child: IconButton(
                                        onPressed: index == 0
                                            ? () {
                                                showToast(
                                                    title:
                                                        "Error : Default city cannot be deleted");
                                              }
                                            : () {
                                                currentCity.removeAt(index);
                                                homeBloc.add(DeleteWeather(
                                                    index: index));
                                              },
                                        icon: const Icon(
                                          size: 20,
                                          Icons.delete,
                                          color: ThemeColors.clrWhite,
                                        )))
                              ],
                            );
                          }));
                }
                return const SizedBox.shrink();
              },
            )
          ]),
        ),
      ),
    );
  }
}
