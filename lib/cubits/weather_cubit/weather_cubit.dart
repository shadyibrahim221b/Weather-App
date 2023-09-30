import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit():super(NoWeatherState());
   WeatherModel? weatherModel;
  getWeatherInfo(String cityName)async{
      try {
       weatherModel= await WeatherService().getweather(cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
      } on Exception {
      // TODO
      emit(WeatherFailureState())
;      }
  }
}