import 'package:http/http.dart' as http;
class  WeatherServicse {
  getdataweather({required String name})async{
  Uri uri = Uri.parse("http://api.weatherapi.com/v1/current.json?key=23f789248ebe4912ac2111912233008&q=London&aqi=no");
  http.Response response =await http.get(uri);

  }



}