import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
class  WeatherServicse {
  static Future<WeatherModel>getdataweather({required String name})async{
    String base ="http://api.weatherapi.com/v1";
  Uri uri = Uri.parse("$base/forecast.json?key=23f789248ebe4912ac2111912233008&q=$name&days=1");
  http.Response response =await http.get(uri);
  Map<String,dynamic> data =jsonDecode(response.body);
    WeatherModel weatherModel  = WeatherModel.fromJson(data);
    return weatherModel;
      }



}