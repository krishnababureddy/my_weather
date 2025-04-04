import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/data/api_helper.dart';

final currentWeatherProvider = FutureProvider.autoDispose(
  (ref) => ApiHelper.getCurrentWeather(),
);
