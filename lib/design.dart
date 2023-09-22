import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weathet_app19/Model/model.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherModel weatherModel;
  String baseURL = "http://api.weatherapi.com/v1";
  String KEY = "0444a8e667114cdfb50104752232009%20";
  String City = "sweden";

  Dio dio = Dio();
  bool isloading = true;
  void initState() {
    super.initState();
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    Response response = await dio
        .get("$baseURL/forecast.json?key=$KEY&q=$City&days=1&aqi=no&alerts=no");
    weatherModel = WeatherModel.fromJson(response.data);
    setState(() {});
    isloading = false;
    print(weatherModel.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5b80b5),
      appBar: AppBar(
        backgroundColor: Color(0xff02468f),
        title: Text(
          "Weather App",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weatherModel.CityName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'updated at ${weatherModel.LastData}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https:${weatherModel.image}",
                        height: 100,
                      ),
                      Text(
                        '${weatherModel.temp}°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Maxtemp: ${weatherModel.maxtemp}°C',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Mintemp: ${weatherModel.mintemp}°C',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '${weatherModel.WeatherCondition}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
