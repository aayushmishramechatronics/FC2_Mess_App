import 'package:flutter/material.dart';

class ContributingScreen extends StatelessWidget {
  const ContributingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contributing")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Contributions are welcome!\n\n"
          "Check out the GitHub repository for details:\n"
          "https://github.com/aaditagrawal/fc-menu",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
