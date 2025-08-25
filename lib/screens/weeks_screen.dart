import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weeks_provider.dart';
import 'week_detail_screen.dart';

class WeeksScreen extends StatefulWidget {
  const WeeksScreen({super.key});

  @override
  State<WeeksScreen> createState() => _WeeksScreenState();
}

class _WeeksScreenState extends State<WeeksScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<WeeksProvider>(context, listen: false).loadLatestMenu();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeeksProvider>(context);

    if (provider.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (provider.error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("All Weeks")),
        body: Center(child: Text("Error: ${provider.error}")),
      );
    }

    if (provider.currentMenu == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("All Weeks")),
        body: const Center(child: Text("No menu available")),
      );
    }

    final menu = provider.currentMenu!;

    return Scaffold(
      appBar: AppBar(title: const Text("Available Menu")),
      body: ListTile(
        title: Text(menu.week),
        subtitle: Text(menu.foodCourt),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => WeekDetailScreen(week: menu),
            ),
          );
        },
      ),
    );
  }
}
