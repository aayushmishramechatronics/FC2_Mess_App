import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/weeks_provider.dart';
import 'screens/root_scaffold.dart';
import 'theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => WeeksProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Court 2 Menu — The Indian Kitchen',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const RootScaffold(),
    );
  }
}
