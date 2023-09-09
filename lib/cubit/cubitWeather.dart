import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/weather_model.dart';
import '../services/weatherServicse.dart';

class cubitWeather extends Cubit<Weatherstate>{
  WeatherService  weatherService  ;
  String? name ;

  WeatherModel? weatherModel;

  cubitWeather(this.weatherService):super(WeatherinitialStat());

  getWeather ({required String name})async{
    emit(Weatherloading());
    try{
      this.name = name;
       weatherModel= await  weatherService.getWeather(cityName:name );
      emit(Weathersuccess());
    }catch(e){
      emit(WeatherReplay());
    }

  }


}


abstract class Weatherstate {}
class WeatherinitialStat extends Weatherstate{}
class Weatherloading extends Weatherstate{}
class Weathersuccess extends Weatherstate{}
class WeatherReplay extends Weatherstate{}