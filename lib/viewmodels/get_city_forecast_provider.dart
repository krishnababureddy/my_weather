import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/cityresponse.dart';
import '../domain/repositories/api_repository.dart';

final cityForecastProvider = FutureProvider.autoDispose.family<CityResponse, String>(
      (ref, cityName) => ApiRepository.getWeatherByCityName(
    cityName: cityName,
  ),
);
