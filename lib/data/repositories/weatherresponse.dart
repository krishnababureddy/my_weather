import '../../domain/models/weather.dart';

class WeatherResponse {
  final Weather? weather;
  final String? errorMessage;

  WeatherResponse({this.weather, this.errorMessage});

  bool get isSuccess => weather != null;
}
