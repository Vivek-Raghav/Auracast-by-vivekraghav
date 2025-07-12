abstract class HomeScreenEvent {}

class FetchWeather extends HomeScreenEvent {
  FetchWeather({required this.params});
  final String params;
}

class UpdateWeather extends HomeScreenEvent {
  UpdateWeather({required this.index, required this.params});
  final String params;
  final int index;
}
