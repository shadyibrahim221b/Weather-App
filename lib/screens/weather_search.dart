import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class WeatherSearch extends StatelessWidget {
  const WeatherSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search weather in a specified city'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(   
            onSubmitted: (value) async{
           var weathercubit=BlocProvider.of<WeatherCubit>(context);
           weathercubit.getWeatherInfo(value);
             Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical:16,horizontal: 8),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter city name',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green
                )
              )
            ),
          ),
        ), 
      ),
    );
  }
  }