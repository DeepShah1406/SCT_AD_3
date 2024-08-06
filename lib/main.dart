import 'package:flutter/material.dart';
import 'package:stopwatchapp/stopwatch_screen.dart';

void main() => runApp(const StopwatchApp());

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData td = ThemeData(primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.lightGreen[100]);
    MaterialApp ma = MaterialApp(title: 'Flutter Stopwatch', theme: td, home: const StopwatchScreen(), debugShowCheckedModeBanner: false);
    return ma;
  }
}