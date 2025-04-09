import '../../domain/models/weather.dart';

class CityResponse {
  final Weather? weather;
  final String? errorMessage;

  CityResponse({this.weather, this.errorMessage});

  bool get isSuccess => weather != null;
}
