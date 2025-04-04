import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/domain/weekly_weather.dart';
import '/data/api_helper.dart';

final weeklyForecastProvider = FutureProvider.autoDispose<WeeklyWeather>(
  (ref) => ApiHelper.getWeeklyForecast(),
);
