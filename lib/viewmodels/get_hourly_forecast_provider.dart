import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/repositories/api_repository.dart';

final hourlyForecastProvider = FutureProvider.autoDispose(
  (ref) => ApiRepository.getHourlyForecast(),
);
