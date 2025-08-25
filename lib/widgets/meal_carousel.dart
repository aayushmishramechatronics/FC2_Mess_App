import 'package:flutter/material.dart';
import 'meal_card.dart';

class MealCarousel extends StatefulWidget {
  final List<Map<String, dynamic>> meals;
  final String highlightKey;
  final bool isPrimaryUpcoming;

  const MealCarousel({
    super.key,
    required this.meals,
    required this.highlightKey,
    required this.isPrimaryUpcoming,
  });

  @override
  State<MealCarousel> createState() => _MealCarouselState();
}

class _MealCarouselState extends State<MealCarousel> {
  late PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    final idx = widget.meals.indexWhere((m) => m["key"] == widget.highlightKey);
    _currentIndex = idx >= 0 ? idx : 0;
    _controller = PageController(
      viewportFraction: 0.85,
      initialPage: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          onPageChanged: (i) => setState(() => _currentIndex = i),
          itemCount: widget.meals.length,
          itemBuilder: (ctx, i) {
            final meal = widget.meals[i];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: MealCard(
                title: meal["title"] as String,
                timeRange: meal["timeRange"] as String,
                meal: meal["meal"],
                mealKey: meal["key"] as String,
                highlight: i == _currentIndex,
                primaryUpcoming: i == _currentIndex && widget.isPrimaryUpcoming,
              ),
            );
          },
        ),
      ],
    );
  }
}
