import 'package:flutter/material.dart';
import '../models/types.dart';
import '../widgets/menu_viewer.dart';

class WeekDetailScreen extends StatelessWidget {
  final WeekMenu week;

  const WeekDetailScreen({super.key, required this.week});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(week.week)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MenuViewer(
          initialWeekId: week.week,
          initialWeek: week,
          routingMode: "detail",
        ),
      ),
    );
  }
}
