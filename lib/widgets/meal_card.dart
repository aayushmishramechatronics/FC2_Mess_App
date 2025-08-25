// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/types.dart';
import 'ui/card.dart';

class MealCard extends StatelessWidget {
  final String title;
  final String timeRange;
  final Meal meal;
  final String mealKey;
  final bool highlight;
  final bool primaryUpcoming;

  const MealCard({
    super.key,
    required this.title,
    required this.timeRange,
    required this.meal,
    required this.mealKey,
    this.highlight = false,
    this.primaryUpcoming = false,
  });

  IconData _getIcon(String key) {
    switch (key) {
      case "breakfast":
        return Icons.free_breakfast;
      case "lunch":
        return Icons.restaurant;
      case "snacks":
        return Icons.cookie;
      case "dinner":
        return Icons.nightlight_round;
      default:
        return Icons.fastfood; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardHeader(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.15),
                    child: Icon(
                      _getIcon(mealKey),
                      color: Theme.of(context).colorScheme.primary,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              Text(
                timeRange,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ],
          ),
        ),
        CardContent(
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: meal.items
                .map(
                  (item) => Chip(
                    label: Text(item),
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );

    if (!highlight) {
      return CustomCard(child: content);
    }

    // Highlight style wrapper
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: primaryUpcoming
              ? [Colors.yellow.withOpacity(0.7), Colors.pink.withOpacity(0.7)]
              : [
                  Colors.blueAccent.withOpacity(0.6),
                  Colors.purpleAccent.withOpacity(0.6)
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(6),
      child: CustomCard(child: content),
    );
  }
}
