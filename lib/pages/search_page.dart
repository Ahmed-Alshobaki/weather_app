import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


import '../Provider/WeatherProvider.dart';
import '../cubit/cubitWeather.dart';
import '../models/weather_model.dart';
import '../services/weatherServicse.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
                BlocProvider.of<cubitWeather>(context).getWeather(name: cityName!);

              //
              // Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
              // Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('search'),
              suffixIcon: GestureDetector(

                  onTap : () async
                  {
                    BlocProvider.of<cubitWeather>(context).getWeather(name: cityName!);
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}