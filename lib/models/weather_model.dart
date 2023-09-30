class WeatherModel{
  String? cityName;
  String? lastUpdateTime;
  String? image;
  double? temperature;
  double? maxTemp;
  double? minTemp;
  String? weatherCondition;
  WeatherModel(
    {
    required this.cityName,
    required this.lastUpdateTime,
    required this.image,
    required this.temperature,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition
    }
    );
    factory WeatherModel.fromJson(json){
      return WeatherModel(
        cityName: json['location']['name'], 
        lastUpdateTime: json['current']['last_updated'], 
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'], 
        temperature: json['forecast']['forecastday'][0]['day']['avgtemp_c'], 
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'], 
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'], 
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text']
        );
    }
}