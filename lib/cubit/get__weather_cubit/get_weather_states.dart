
//import 'package:weather_app/models/weather_models.dart';

import 'package:weather_app/models/weather_models.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailurState extends WeatherState{}