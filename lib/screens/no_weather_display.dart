import 'package:flutter/material.dart';

class NoWeatherDisplay extends StatelessWidget {
  const NoWeatherDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('there is no weather to display 😌 ,click on search 🔎 to start displaying a weather info',style: TextStyle(fontSize: 20,color: Colors.black),),
            ),
        ],
        ),
      ),
    );
    
  }
  }