import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/domain/hourly_weather.dart';
import '/data/api_helper.dart';

final hourlyForecastProvider = FutureProvider.autoDispose<HourlyWeather>(
  (ref) => ApiHelper.getHourlyForecast(),
);
