import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/constants/text_styles.dart';
import '/extensions/datetime.dart';
import '/extensions/strings.dart';
import '/viewmodels/get_city_forecast_provider.dart';
import '/screens/weather_screen/weather_info.dart';
import '/views/gradient_container.dart';

class WeatherDetailScreen extends ConsumerWidget {
  const WeatherDetailScreen({
    super.key,
    required this.cityName,
  });

  final String cityName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityWeatherAsync = ref.watch(cityForecastProvider(cityName));

    return Scaffold(
      body: cityWeatherAsync.when(
        data: (response) {
          if (response.errorMessage != null) {
            return Center(
              child: Text(
                response.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final weather = response.weather!;
          return GradientContainer(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30, width: double.infinity),

                  Text(
                    weather.name,
                    style: TextStyles.h1,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    DateTime.now().dateTime,
                    style: TextStyles.subtitleText,
                  ),

                  const SizedBox(height: 50),

                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 50),

                  Text(
                    weather.weather[0].description.capitalize,
                    style: TextStyles.h2,
                  ),
                ],
              ),

              const SizedBox(height: 40),
              // WeatherInfo(weather: weather),
              const SizedBox(height: 15),
            ],
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              'An error occurred: $error',
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
