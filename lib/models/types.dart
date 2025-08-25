class Meal {
  final String name;
  final String startTime;
  final String endTime;
  final List<String> items;

  Meal({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.items,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['name'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      items: List<String>.from(json['items'] as List),
    );
  }
}

class DayMenu {
  final String day;
  final Map<String, Meal> meals;

  DayMenu({required this.day, required this.meals});

  factory DayMenu.fromJson(Map<String, dynamic> json) {
    final mealsJson = json['meals'] as Map<String, dynamic>;
    return DayMenu(
      day: json['day'] as String,
      meals: mealsJson.map(
        (key, value) => MapEntry(key, Meal.fromJson(value)),
      ),
    );
  }
}

class WeekMenu {
  final String foodCourt;
  final String week;
  final Map<String, DayMenu> menu;

  WeekMenu({
    required this.foodCourt,
    required this.week,
    required this.menu,
  });

  factory WeekMenu.fromJson(Map<String, dynamic> json) {
    final menuJson = json['menu'] as Map<String, dynamic>;
    return WeekMenu(
      foodCourt: json['foodCourt'] as String,
      week: json['week'] as String,
      menu: menuJson.map(
        (date, dayData) => MapEntry(date, DayMenu.fromJson(dayData)),
      ),
    );
  }
}
