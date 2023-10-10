import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathet_app19/Manger/weather/weather_cubit.dart';
import 'package:weathet_app19/Screen/Home_Screen.dart';

import 'package:weathet_app19/Screen/design.dart';

void main() {
  runApp(Weather_App());
}

class Weather_App extends StatelessWidget {
  const Weather_App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
