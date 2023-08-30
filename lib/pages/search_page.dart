import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../models/weather_model.dart';
import '../services/weatherServicse.dart';


class SearchPage extends StatelessWidget {
  TextEditingController  textEditingController  = new TextEditingController();
  String? nameCite ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
          onSubmitted: (val){
            WeatherServicse.getdataweather(name: val);
          },
            controller:textEditingController ,
            decoration: InputDecoration(
             suffixIcon: Icon(Icons.search),
                 hintText: 'Enter a city name',
                 border: OutlineInputBorder(),
                contentPadding: EdgeInsetsDirectional.symmetric(vertical: 25,horizontal: 20),
            ),

          ),

        ),
      ),
    );
  }
}

