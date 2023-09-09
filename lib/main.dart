import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/services/weatherServicse.dart';

import 'Provider/WeatherProvider.dart';
import 'cubit/cubitWeather.dart';


void main() {
  runApp(BlocProvider(
      create: (context) {
        return cubitWeather(WeatherService());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: BlocProvider.of<cubitWeather>(context).weatherModel == null ?  Colors.blue : BlocProvider.of<cubitWeather>(context).weatherModel!.getThemeColor()  ,
      ),
      home: Home(),
    );
  }
}