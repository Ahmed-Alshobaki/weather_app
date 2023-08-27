import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/home_page.dart';


void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      home: HomePage(),
    );
  }
}
