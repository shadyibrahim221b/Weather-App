import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService{
  final dio = Dio();
 Future<WeatherModel> getweather(String cityName) async{

      try {
      Response response = await dio.get('http://api.weatherapi.com/v1/forecast.json?key=fc53ee32f28345198be02009232509&q=$cityName&days=1&aqi=no&alerts=no');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
        } on DioException catch (e) {
          // TOOD
          final String errorMessage = e.response?.data['error']['message'] ?? 'Response error';
          throw Exception(errorMessage);
        }
        }
    }