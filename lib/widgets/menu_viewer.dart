import 'package:flutter/material.dart';
import '../models/types.dart';
import 'inline_select.dart';
import 'meal_carousel.dart';

class MenuViewer extends StatefulWidget {
  final String initialWeekId;
  final WeekMenu initialWeek;
  final String routingMode;

  const MenuViewer({
    super.key,
    required this.initialWeekId,
    required this.initialWeek,
    this.routingMode = "home",
  });

  @override
  State<MenuViewer> createState() => _MenuViewerState();
}

class _MenuViewerState extends State<MenuViewer> {
  late String weekId;
  late WeekMenu week;
  late String foodCourt;
  late String dateKey;

  @override
  void initState() {
    super.initState();
    weekId = widget.initialWeekId;
    week = widget.initialWeek;
    foodCourt = week.foodCourt;

    dateKey = week.menu.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    const order = ["breakfast", "lunch", "snacks", "dinner"];
    final today = week.menu[dateKey]!;

    final meals = order
        .where((k) => today.meals[k] != null)
        .map((k) => {
              "key": k,
              "meal": today.meals[k]!,
              "timeRange":
                  "${today.meals[k]!.startTime} – ${today.meals[k]!.endTime}",
              "title": k[0].toUpperCase() + k.substring(1),
            })
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(foodCourt, style: Theme.of(context).textTheme.headlineSmall),
        Text(week.week, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        InlineSelect<String>(
          label: "Day",
          value: dateKey,
          options: week.menu.keys.map((d) => {"label": d, "value": d}).toList(),
          onChange: (v) => setState(() => dateKey = v),
        ),
        const SizedBox(height: 16),
        MealCarousel(
          meals: meals,
          highlightKey: meals.first["key"] as String,
          isPrimaryUpcoming: true,
        ),
      ],
    );
  }
}
