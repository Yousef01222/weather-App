import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_models.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '81163e57b715410d8a7115222240109';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModels = WeatherModel.fromjson(response.data);
      return weatherModels;
    } on DioException catch (e) {
      final String errmessage =
          e.response?.data['error']['message'] ?? 'opps threr an was erroes';
      throw Exception(errmessage);
    } catch (e) {
      log(e.toString());
      throw Exception('  opps threr an was erroes');
    }
  }
}
