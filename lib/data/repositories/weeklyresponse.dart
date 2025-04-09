



import '../../domain/models/weekly_weather.dart';

class WeeklyResponse {
  final WeeklyWeather? weeklyweather;
  final String? errorMessage;

  WeeklyResponse({this.weeklyweather, this.errorMessage});

  bool get isSuccess => weeklyweather != null;
}
