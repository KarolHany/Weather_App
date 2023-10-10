part of 'weather_cubit.dart';

abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherILoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherILoaded({required this.weatherModel});
}

final class WeatherFailure extends WeatherState {}
