import 'package:flutter/material.dart';

import 'package:weathet_app19/design.dart';

void main() {
  runApp(Weather_App());
}

class Weather_App extends StatelessWidget {
  const Weather_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}
