import 'dart:convert';
import 'dart:io';

import 'package:easy_job_app/models/Suggestion.dart';
import 'package:http/http.dart';

import '../models/Place.dart';

class PlaceApiProvider {
  final client = Client();
  final sessionToken;

  PlaceApiProvider(this.sessionToken);

  static const String androidKey = 'AIzaSyDzS17TKyGj6vQg1wLeHlSnuEmWv_H_YeM';
  static const String iosKey = 'YOUR_API_KEY_HERE';
  final apiKey = Platform.isAndroid ? androidKey : iosKey;

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        Uri.https('maps.googleapis.com', '/maps/api/place/autocomplete/json', {
      'input': input,
      'types': 'address',
      'language': lang,
      'components': 'country:de',
      'key': apiKey,
      'sessiontoken': sessionToken,
    });

    final response = await client.get(request);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        // compose suggestions in a list
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    // if you want to get the details of the selected place by place_id

    final request =
        Uri.https('maps.googleapis.com', '/maps/api/place/details/json', {
      'place_id': placeId,
      'fields': 'address_component',
      'key': apiKey,
      'sessiontoken': sessionToken,
    });

    final response = await client.get(request);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final components =
            result['result']['address_components'] as List<dynamic>;
        // build result
        final place = Place();
        for (var c in components) {
          final List type = c['types'];
          if (type.contains('street_number')) {
            place.streetNumber = c['long_name'];
          }
          if (type.contains('route')) {
            place.street = c['long_name'];
          }
          if (type.contains('locality')) {
            place.city = c['long_name'];
          }
          if (type.contains('postal_code')) {
            place.zipCode = c['long_name'];
          }
        }
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
