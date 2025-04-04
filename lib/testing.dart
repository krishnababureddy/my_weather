import 'package:flutter/material.dart';
import '/constants/app_colors.dart';
import '/constants/text_styles.dart';
import '/views/famous_cities_weather.dart';
import '/views/gradient_container.dart';
import '/widgets/round_text_field.dart';
import '/domain/famous_city.dart';
import '/screens/weather_detail_screen.dart';
import '/widgets/city_weather_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;
  String? errorMessage;
  List<FamousCity> filteredCities = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCities(String query) {
    final input = query.trim().toLowerCase();

    setState(() {
      if (input.isEmpty) {
        filteredCities = [];
        errorMessage = null;
      } else {
        final results = famousCities
            .where((city) => city.name.toLowerCase().contains(input))
            .toList();

        if (results.isEmpty) {
          errorMessage = 'No matching cities found.';
        } else {
          errorMessage = null;
        }
        filteredCities = results;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Pick Location',
            style: TextStyles.h1,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Find the area or city that you want to know the detailed weather info at this time',
          style: TextStyles.subtitleText,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),

        // Search Field with Real-time Filtering
        RoundTextField(
          controller: _searchController,
          hintText: 'Enter city name',
          onChanged: _filterCities,
        ),

        if (errorMessage != null) ...[
          const SizedBox(height: 10),
          Text(
            errorMessage!,
            style: const TextStyle(color: Colors.red),
          ),
        ],

        const SizedBox(height: 30),

        // Famous Cities Grid
        const FamousCitiesWeather(),

        const Divider(height: 40, color: Colors.grey),

        // Filtered Cities Grid
        if (filteredCities.isNotEmpty) ...[
          const Text(
            'Search Results:',
            style: TextStyles.h2,
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredCities.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final city = filteredCities[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => WeatherDetailScreen(
                        cityName: city.name,
                      ),
                    ),
                  );
                },
                child: CityWeatherTile(
                  index: index,
                  city: city,
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}
