

import '../../domain/models/hourly_weather.dart';

class HourlyResponse {
  final HourlyWeather? hourlyweather;
  final String? errorMessage;

  HourlyResponse({this.hourlyweather, this.errorMessage});

  bool get isSuccess => hourlyweather != null;
}
