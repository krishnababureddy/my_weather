import 'package:flutter/foundation.dart' show immutable;

import '../../data/apidatasource/getlocator.dart';
import '../../data/apidatasource/service.dart';
import '../../data/repositories/cityresponse.dart';
import '../../data/repositories/hourlyresponse.dart';
import '../../data/repositories/weatherresponse.dart';
import '../../data/repositories/weeklyresponse.dart';
import '../models/hourly_weather.dart';
import '../models/weather.dart';
import '../models/weekly_weather.dart';
import '/constants/constants.dart';
import '../../domain/models/weather.dart';


@immutable
class ApiRepository {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl = 'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';

  static double lat = 0.0;
  static double lon = 0.0;

  static String _constructWeatherUrl() =>
      '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructForecastUrl() =>
      '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructWeatherByCityUrl(String cityName) =>
      '$baseUrl/weather?q=$cityName&units=metric&appid=${Constants.apiKey}';

  static String _constructWeeklyForecastUrl() =>
      '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';

  //! Get lat and lon
  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }





  // 1. Fetch Current location weather
  static Future<WeatherResponse> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructWeatherUrl();

    //  Use the method from ApiService now
    final response = await ApiService.fetchcurrentweatherData(url);

    if (response.containsKey('errorMessage')) {
      return WeatherResponse(errorMessage: response['errorMessage']);
    }

    try {
      final weather = Weather.fromJson(response);
      return WeatherResponse(weather: weather);
    } catch (e) {
      return WeatherResponse(errorMessage: 'Error parsing weather data: $e');
    }
  }


  // 2. Fetch Hourly Weather
  static Future<HourlyResponse> getHourlyForecast() async {
    await fetchLocation();
    final url = _constructForecastUrl();

    //  Use the method from ApiService now
    final response = await ApiService.fetchcurrentweatherData(url);

    if (response.containsKey('errorMessage')) {
      return HourlyResponse(errorMessage: response['errorMessage']);
    }

    try {
      final hourweather = HourlyWeather.fromJson(response);
      return HourlyResponse(hourlyweather: hourweather);
    } catch (e) {
      return HourlyResponse(errorMessage: 'Error parsing weather data: $e');
    }
  }



  // 3. Fetch Weather by City Name
  static Future<CityResponse> getWeatherByCityName({required String cityName,}) async {
    await fetchLocation();
    final url = _constructWeatherByCityUrl(cityName);

    //  Use the method from ApiService now
    final response = await ApiService.fetchcurrentweatherData(url);

    if (response.containsKey('errorMessage')) {
      return CityResponse(errorMessage: response['errorMessage']);
    }

    try {
      final weather = Weather.fromJson(response);
      return CityResponse(weather: weather);
    } catch (e) {
      return CityResponse(errorMessage: 'Error parsing weather data: $e');
    }
  }


  // 4. Fetch Weather by Weekly weather
  static Future<WeeklyResponse> getWeeklyForecast() async {
    await fetchLocation();
    final url = _constructWeeklyForecastUrl();

    //  Use the method from ApiService now
    final response = await ApiService.fetchcurrentweatherData(url);

    if (response.containsKey('errorMessage')) {
      return WeeklyResponse(errorMessage: response['errorMessage']);
    }

    try {
      final weather = WeeklyWeather.fromJson(response);
      return WeeklyResponse(weeklyweather: weather);
    } catch (e) {
      return WeeklyResponse(errorMessage: 'Error parsing weather data: $e');
    }
  }





}
