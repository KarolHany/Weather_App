class WeatherModel {
  final String CityName;
  final String LastData;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String image;
  final String WeatherCondition;

  WeatherModel({
    required this.CityName,
    required this.LastData,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.image,
    required this.WeatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        CityName: json["location"]["name"],
        LastData: json["current"]["last_updated"],
        temp: json["current"]["temp_c"],
        maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        mintemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        image: json["current"]["condition"]["icon"],
        WeatherCondition: json["current"]["condition"]["text"]);
  }
}
