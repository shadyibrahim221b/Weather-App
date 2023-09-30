import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/screens/no_weather_display.dart';
import 'package:weather_app/screens/weather_display.dart';
import 'package:weather_app/screens/weather_search.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App'),centerTitle: true,
      actions: [IconButton(onPressed:() {
        Navigator.push(context, MaterialPageRoute(builder:(context) {
          return WeatherSearch();
        },));
      }, icon: Icon(Icons.search))],
      ),
      body: BlocBuilder<WeatherCubit ,WeatherStates>(
        builder:(context, state) {
          if(state is NoWeatherState){
            return NoWeatherDisplay();
          }
          else if( state is WeatherLoadedState){
            return WeatherDisplay(weatherModel: state.weatherModel,);
          }
          else{
            return Center(child: Text('Respone error failure',style: TextStyle(fontSize: 30,color: Colors.red),));
          }
        },
        ),
    );
  }
}