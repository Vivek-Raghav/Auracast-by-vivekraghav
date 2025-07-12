# 🌤️ AuraCast - Advanced Weather App

[![Flutter](https://img.shields.io/badge/Flutter-3.19+-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.3+-blue.svg)](https://dart.dev/)
[![BLoC](https://img.shields.io/badge/BLoC-Pattern-blue.svg)](https://bloclibrary.dev/)
[![Clean Architecture](https://img.shields.io/badge/Architecture-Clean-green.svg)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

A modern, feature-rich weather application built with Flutter using Clean Architecture principles and BLoC pattern for state management. This project serves as an excellent learning resource for Flutter developers who want to understand enterprise-level app development.

## 🚀 Features

### ✨ Core Features
- **Real-time Weather Data**: Get current weather conditions for any city worldwide
- **Multi-City Support**: Add and manage multiple cities with swipe navigation
- **Dynamic Weather Backgrounds**: Beautiful UI that changes based on weather conditions
- **City Search**: Search and add new cities with autocomplete functionality
- **Offline Support**: Cached weather data for offline viewing
- **Responsive Design**: Works seamlessly across different screen sizes

### 🎨 UI/UX Features
- **Glass Morphism Design**: Modern glass-like search bar and UI elements
- **Weather-based Themes**: Dynamic backgrounds and colors based on weather conditions
- **Smooth Animations**: Page transitions and weather data updates
- **Dot Indicators**: Visual navigation for multiple cities
- **Pull-to-Refresh**: Easy data refresh functionality

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles with a clear separation of concerns:

```
lib/
├── blocs/           # State Management (BLoC Pattern)
├── core/            # Shared utilities, constants, and base classes
├── home/            # Weather feature module
├── injection_container/  # Dependency Injection setup
├── routes/          # Navigation and routing
└── main.dart        # App entry point
```

### 📁 Project Structure Deep Dive

#### 1. **BLoC Layer** (`lib/blocs/`)
- **Events**: Define what actions can be performed
- **States**: Represent the UI state at any given time
- **Bloc**: Contains the business logic and state management

```dart
// Example: Weather fetching flow
FetchWeather Event → HomeScreenBloc → WeatherLoaded State
```

#### 2. **Core Module** (`lib/core/`)
- **Constants**: App-wide constants and configurations
- **Error Handling**: Centralized error management
- **Local Storage**: Shared preferences and caching
- **Utils**: Common utility functions and extensions
- **Theme**: App theming and styling

#### 3. **Home Module** (`lib/home/`)
- **Data Layer**: API calls, repositories, and data sources
- **Domain Layer**: Business logic and use cases
- **Presentation Layer**: UI components and pages

#### 4. **Dependency Injection** (`lib/injection_container/`)
- **GetIt**: Service locator for dependency injection
- **Modular Setup**: Organized injection for different layers

## 🛠️ Technology Stack

### Core Technologies
- **Flutter 3.19+**: Cross-platform UI framework
- **Dart 3.3+**: Programming language
- **BLoC Pattern**: State management
- **Clean Architecture**: Project structure

### Key Dependencies
```yaml
# State Management
flutter_bloc: ^8.1.6
equatable: ^2.0.5

# Network & Data
dio: ^5.7.0
json_annotation: ^4.9.0
json_serializable: 6.8.0

# Dependency Injection
get_it: ^8.0.3

# Navigation
go_router: ^13.2.0

# Local Storage
shared_preferences: ^2.5.3

# Connectivity
connectivity_plus: ^6.0.5

# Error Handling
dartz: 0.10.1
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.19 or higher)
- Dart SDK (3.3 or higher)
- Android Studio / VS Code
- Git

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Vivek-Raghav/auracast.git
   cd auracast
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (for JSON serialization)
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### 🔧 Configuration

#### API Key Setup
1. Get a free API key from [OpenWeatherMap](https://openweathermap.org/api)
2. Add your API key to the weather data source implementation
3. The app will automatically fetch weather data for your cities

#### Firebase Setup (Optional)
The app includes Firebase integration for future features:
1. Create a Firebase project
2. Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
3. Configure Firebase in your project

## 📚 Learning Resources

### For Beginners

#### 1. **Understanding the Architecture**
- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Clean Architecture Guide](https://medium.com/flutter-community/flutter-clean-architecture-series-part-1-d2d4c6e1749f)

#### 2. **BLoC Pattern**
- [BLoC Official Documentation](https://bloclibrary.dev/)
- [Flutter BLoC Tutorial](https://www.youtube.com/watch?v=PLHln7wHgPE)

#### 3. **Dependency Injection**
- [GetIt Package](https://pub.dev/packages/get_it)
- [Flutter Dependency Injection](https://medium.com/flutter-community/dependency-injection-in-flutter-with-get-it-6b8b8b8b8b8b)

### Key Concepts to Study

1. **State Management**: Understand how BLoC manages app state
2. **Repository Pattern**: Learn about data abstraction
3. **Use Cases**: Business logic separation
4. **Error Handling**: How failures are managed
5. **Dependency Injection**: Service locator pattern

## 🔍 Code Examples

### Adding a New City
```dart
// In HomeScreen
Future<void> _searchCity() async {
  final selectedCity = await context.push<String>(AppRoutes.citySearch);
  if (selectedCity != null) {
    homeBloc.add(FetchWeather(params: selectedCity));
  }
}
```

### BLoC Event Handling
```dart
// In HomeScreenBloc
on<FetchWeather>(_onFetchWeather);

Future<void> _onFetchWeather(
    FetchWeather event, Emitter<HomeScreenState> emit) async {
  emit(WeatherLoading());
  try {
    final result = await weatherApiUC(event.params);
    result.fold(
      (failure) => emit(WeatherError(message: failure.toString())),
      (data) => emit(WeatherLoaded(weatherApiResponse: [data]))
    );
  } catch (e) {
    emit(WeatherError(message: e.toString()));
  }
}
```

### Weather Data Model
```dart
@JsonSerializable()
class WeatherApiResponse {
  final Coord? coord;
  final List<Weather>? weather;
  final Main? main;
  final String? name;
  
  // JSON serialization methods
  factory WeatherApiResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiResponseFromJson(json);
}
```

## 🧪 Testing

### Running Tests
```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widget_test.dart

# Integration tests
flutter test integration_test/
```

### Test Structure
- **Unit Tests**: Test individual functions and classes
- **Widget Tests**: Test UI components
- **Integration Tests**: Test complete user flows

## 📱 Platform Support

- ✅ Android (API 21+)
- ✅ iOS (iOS 12.0+)
- ✅ Web (Chrome, Firefox, Safari)
- ✅ macOS
- ✅ Windows
- ✅ Linux

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### Ways to Contribute
1. **Report Bugs**: Create issues for bugs you find
2. **Feature Requests**: Suggest new features
3. **Code Improvements**: Submit pull requests
4. **Documentation**: Help improve this README
5. **Testing**: Add tests for new features

### Development Workflow
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Follow Dart/Flutter conventions
- Use meaningful variable and function names
- Add comments for complex logic
- Write tests for new features

## 🐛 Common Issues & Solutions

### Build Issues
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run

# Regenerate code
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### API Issues
- Check your internet connection
- Verify API key is correct
- Ensure API quota hasn't been exceeded

### State Management Issues
- Ensure events are properly dispatched
- Check BLoC state transitions
- Verify error handling in BLoC

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [OpenWeatherMap](https://openweathermap.org/) for weather data API
- [Flutter Team](https://flutter.dev/) for the amazing framework
- [BLoC Library](https://bloclibrary.dev/) for state management
- All contributors and supporters

## 📞 Support & Contact

- **Author**: Vivek Raghav
- **GitHub**: [@Vivek-Raghav](https://github.com/Vivek-Raghav)
- **Issues**: [GitHub Issues](https://github.com/Vivek-Raghav/auracast/issues)

---

⭐ **If this project helped you learn Flutter, please give it a star!** ⭐

**Happy Coding! 🚀**

