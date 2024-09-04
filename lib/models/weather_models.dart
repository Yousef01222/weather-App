class WeatherModel {
  final String cityName;
  final DateTime data;
  final String? image;
  final num temp;
  final num maxtemp;
  final num mintemp;
  final String weathercondition;
  final num wind;
  final num humbidity;

   WeatherModel({
    required this.cityName,
    required this.data,
     this.image,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weathercondition,
    required this.wind,
    required this.humbidity
  });

  factory WeatherModel.fromjson(json){
    return WeatherModel(
      cityName:json ['location']['name'] ,
      data: DateTime.parse(json['current']['last_updated'],),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day'] ['maxtemp_c'],
      mintemp:     json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weathercondition:  json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      wind: json['current']['wind_degree'] ,
      humbidity:json['current']['humidity'] ,
      );
  }

  
}
