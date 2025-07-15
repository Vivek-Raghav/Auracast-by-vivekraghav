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

class DeleteWeather extends HomeScreenEvent {
  DeleteWeather({required this.index});
  final int index;
}

class ChangeCurrentWeatherIndex extends HomeScreenEvent {
  final int index;
  ChangeCurrentWeatherIndex(this.index);
}

// New events for data persistence
class LoadSavedData extends HomeScreenEvent {}

class SaveCurrentData extends HomeScreenEvent {}
