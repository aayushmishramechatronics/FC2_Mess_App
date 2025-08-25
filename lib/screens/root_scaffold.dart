import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'weeks_screen.dart';
import 'contributing_screen.dart';

class RootScaffold extends StatefulWidget {
  const RootScaffold({super.key});

  @override
  State<RootScaffold> createState() => _RootScaffoldState();
}

class _RootScaffoldState extends State<RootScaffold> {
  int _selectedIndex = 0;

  final _pages = const [HomeScreen(), WeeksScreen(), ContributingScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Weeks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: "Contributing",
          ),
        ],
      ),
    );
  }
}
