import 'dart:convert';
import 'package:Atleasy/models/location.dart';
import 'package:Atleasy/models/experience.dart';
import 'package:http/http.dart' as http;

class LocationApi {
  static Future<List<Location>> getLocations() async {
      final response = await http.get(Uri.parse('https://anasfalah3.github.io/atleasy_api/atleasy.json'));

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['locations']) {
      _temp.add(i);
    }

    return Location.locationsFromSnapshot(_temp);
  }
}


class ExperienceApi {
  static Future<List<Experience>> getExperiences() async {
      final response = await http.get(Uri.parse('https://anasfalah3.github.io/atleasy_api/atleasy.json'));

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['experiences']) {
      _temp.add(i);
    }

    return Experience.experiencesFromSnapshot(_temp);
  }
}