import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathet_app19/Manger/weather/weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onFieldSubmitted: (value) {
                var WeatherCubitVar = BlocProvider.of<WeatherCubit>(context);
                WeatherCubitVar.getweather(city: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  labelText: "City Name",
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(Icons.location_city),
                  ),
                  border: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
