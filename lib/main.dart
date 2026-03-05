import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const SmartWeatherApp());
}

class SmartWeatherApp extends StatelessWidget {
  const SmartWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Weather Control',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF2F4F7),
        fontFamily: 'San Francisco',
      ),
      home: const HomePage(),
    );
  }
}
