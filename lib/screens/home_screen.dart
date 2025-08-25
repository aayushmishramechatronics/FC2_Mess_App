// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weeks_provider.dart';
import '../widgets/menu_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = Provider.of<WeeksProvider>(context, listen: false);
      provider.loadLatestMenu(); // ✅ updated
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeeksProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text("Error: ${provider.error}"));
    }

    if (provider.currentMenu == null) {
      return const Center(child: Text("No menu available"));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MenuViewer(
        initialWeekId: provider.currentMenu!.week,
        initialWeek: provider.currentMenu!,
        routingMode: "home",
      ),
    );
  }
}
