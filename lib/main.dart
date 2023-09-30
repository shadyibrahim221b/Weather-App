import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/screens/home_view.dart';

void main() {
  runApp(
    BlocProvider(
    create:(context) => WeatherCubit(),
    child: Builder(
      builder:(context) =>  BlocBuilder<WeatherCubit,WeatherStates>(
        builder:(context, state) =>  MaterialApp(
          theme: ThemeData(
            primarySwatch: getThemeColor(
              BlocProvider.of<WeatherCubit>(context).weatherModel?.weatherCondition
            )
          ),
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        ),
      ),
    ),
  )
  );
}
MaterialColor getThemeColor(String? condition){
    switch(condition){
      case 'Sunny':
      case 'Clear':
        return Colors.orange; 
      case 'Partly cloudy':
      case 'Cloudy':
      case 'Overcast':
        return Colors.blueGrey;
      case 'Mist':
      case 'Fog':
      case 'Freezing fog':
        return Colors.blueGrey;
      case 'Patchy rain possible':
      case 'Patchy light rain':
      case 'Light rain':
      case 'Moderate rain at times':
      case 'Moderate rain':
      case 'Heavy rain at times':
      case 'Light rain shower':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
        return Colors.lightBlue;
      case 'Patchy snow possible':
      case 'Patchy light snow':
      case 'Light snow':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
        return Colors.lightBlue;
      case 'Patchy sleet possible':
      case 'Light sleet':
      case 'Moderate or heavy sleet':
      case 'Light sleet showers':
      case 'Moderate or heavy sleet showers':
        return Colors.lightBlue;
      case 'Patchy freezing drizzle possible':
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
      case 'Light showers of ice pellets':
      case 'Moderate or heavy  showers of ice pellets':
      case 'Thundery outbreaks possible':
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Ice pellets':
      case 'Blowing snow':
      case 'Blizzard':
        return Colors.lightBlue;
       default:
       return Colors.blue;
    }
  }