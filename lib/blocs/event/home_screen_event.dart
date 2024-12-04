abstract class HomeScreenEvent {}

class FetchWeather extends HomeScreenEvent {
  FetchWeather({required this.params});
  final String params;
}
