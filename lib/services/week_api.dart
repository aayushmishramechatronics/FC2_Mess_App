import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/types.dart';

class WeekApi {
  static const String baseUrl = "https://tikm.coolstuff.work/api/menu";

  /// Fetch a full WeekMenu by ID
  static Future<WeekMenu> fetchWeekById(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeekMenu.fromJson(data);
    }

    throw Exception("Failed to load week $id");
  }
}
