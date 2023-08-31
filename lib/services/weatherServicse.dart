import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
// class  WeatherServicse {
//   static Future<WeatherModel>getdataweather({required String name})async{
//     String base ="http://api.weatherapi.com/v1";
//   Uri uri = Uri.parse("$base/forecast.json?key=23f789248ebe4912ac2111912233008&q=$name&days=1");
//   http.Response response =await http.get(uri);
//   Map<String,dynamic> data =jsonDecode(response.body);
//     WeatherModel weatherModel  = WeatherModel.fromJson(data);
//     return weatherModel;
//       }
//
//
//
// }
class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';

  String apiKey = '23f789248ebe4912ac2111912233008';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
    Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      var data  = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}