import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/types.dart';

class WeeksApi {
  static const String baseUrl = "https://tikm.coolstuff.work/api/menu";

  /// Fetch latest menu or filter by params
  static Future<WeekMenu> fetchMenu({
    String? week,
    String? weekStart,
    String? date,
  }) async {
    final uri = Uri.parse(baseUrl).replace(queryParameters: {
      if (week != null) 'week': week,
      if (weekStart != null) 'weekStart': weekStart,
      if (date != null) 'date': date,
    });

    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      return WeekMenu.fromJson(data);
    } else {
      throw Exception("Failed to fetch menu: ${res.statusCode} ${res.body}");
    }
  }
}
