import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/api/config.dart';
import 'package:travel_app/models/place.dart';

class TripAdvisorApi {
  static const String baseUrl = 'https://travel-advisor.p.rapidapi.com';
  static const Map<String, String> headers = {
    'X-RapidAPI-Key': TRAVEL_API_KEY,
    'X-RapidAPI-Host': 'travel-advisor.p.rapidapi.com',
  };

  static Future<List<Place>> fetchPropertiesByLatLng({
    String latitude = '12.91285',
    String longitude = '100.87808',
    String lang = 'en_US',
    String limit = '30',
    String currency = 'USD',
    String propertyType = 'hotels',
  }) async {
    final Map<String, String> queryParams = {
      'latitude': latitude,
      'longitude': longitude,
      'lang': lang,
      'limit': limit,
      'currency': currency,
    };

    final Uri uri = Uri.parse('$baseUrl/$propertyType/list-by-latlng/')
        .replace(queryParameters: queryParams);

    try {
      final http.Response response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body)['data'];
        List<Place> places =
            jsonList.map((json) => Place.fromJson(json)).toList();
        return places;
      } else {
        print('Request failed with status: ${response.body}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }
}
