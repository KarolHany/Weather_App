import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathet_app19/Manger/weather/weather_cubit.dart';
import 'package:weathet_app19/Screen/No_Weather.dart';
import 'package:weathet_app19/Screen/SearchScreen.dart';
import 'package:weathet_app19/Screen/design.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 75, 128),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return NoWeather();
          } else if (state is WeatherILoaded) {
            return WeatherScreen(
              weatherModel: state.weatherModel,
            );
          } else {
            return NoWeather();
          }
        },
      ),
    );
  }
}
