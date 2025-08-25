import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/types.dart';

class MenuApi {
  static const String _baseUrl = String.fromEnvironment(
    "MENU_API_URL",
    defaultValue: "https://tikm.coolstuff.work",
  );

  static Future<WeekMenu> fetchMenu({
    String? week,
    String? weekStart,
    String? date,
  }) async {
    final uri = Uri.parse("$_baseUrl/api/menu").replace(
      queryParameters: {
        if (week != null) "week": week,
        if (weekStart != null) "weekStart": weekStart,
        if (date != null) "date": date,
      },
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Failed to fetch menu");
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return WeekMenu.fromJson(data);
  }
}
