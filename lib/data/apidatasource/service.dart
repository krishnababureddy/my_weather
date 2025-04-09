



import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;
import '/utils/logging.dart';

@immutable
class ApiService {
  static final dio = Dio();

  static Future<Map<String, dynamic>> fetchcurrentweatherData(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return {
          'errorMessage': 'Failed to load data: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {
        'errorMessage': 'Error fetching data from $url: $e',
      };
    }
  }


}
