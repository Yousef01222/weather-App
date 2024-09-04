import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get__weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_models.dart';
//import 'package:weather_app/models/weather_models.dart';
//import 'package:weather_app/widget/categroy_list.dart';
//import 'package:weather_app/widget/items_list.dart';
//import 'package:weather_app/widget/items_list.dart';
//import 'package:weather_app/models/weather_models.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weathercondition),
            getThemeColor(weatherModel.weathercondition)[300]!,
            getThemeColor(weatherModel.weathercondition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 45),
          child: Column(
            children: [
              Text(
                weatherModel.cityName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'update at ${weatherModel.data.hour}:${weatherModel.data.minute}',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: "https:${weatherModel.image}",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      const Text('opps there was an erros'),
                ),
              ),
              Text(
                weatherModel.weathercondition,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
             const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.air,
                    size: 35,
                  ),
                  SizedBox(
                    width: 25,
                  ),
              Icon(
                Icons.thermostat_auto,
                size: 35,
                ),
                
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.water_drop_rounded,
                    size: 35,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      (weatherModel.wind).toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      (weatherModel.temp).round().toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      weatherModel.humbidity.round().toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    )
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      'Wind',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Temperature',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'humidity',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Today',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 130,
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('maxtemp  ${weatherModel.maxtemp.round()}'),
                      Image.network(
                        "https:${weatherModel.image}",
                      ),
                      Text('mintemp ${weatherModel.mintemp.round()}'),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




    