import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/repositories/api_repository.dart';

final weeklyForecastProvider = FutureProvider.autoDispose(
  (ref) => ApiRepository.getWeeklyForecast(),
);
