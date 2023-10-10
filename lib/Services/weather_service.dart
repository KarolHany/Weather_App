import 'package:dio/dio.dart';
import 'package:weathet_app19/Model/model.dart';

class WeatherService {
  late WeatherModel weatherModel;
  Dio dio = Dio();
  bool isloading = true;
  String baseURL = "http://api.weatherapi.com/v1";
  String KEY = "0444a8e667114cdfb50104752232009%20";

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    Response response = await dio.get(
        "${baseURL}/forecast.json?key=${KEY}&q=${cityName}&days=1&aqi=no&alerts=no");
    weatherModel = WeatherModel.fromJson(response.data);

    return weatherModel;
  }
}
