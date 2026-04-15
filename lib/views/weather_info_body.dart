import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weatherModel,
    required this.weather,
  });
  final WeatherModel weatherModel;
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                getThemeColor(weatherModel.weatherCondition),
                getThemeColor(weatherModel.weatherCondition)[300]!,
                getThemeColor(weatherModel.weatherCondition)[50]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.network(
                        'https:${weatherModel.image!}',
                        height: 100,
                        width: 60,
                      ),
                    ),
                    Text(
                      weatherModel.temp.toString(),
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        Text('MaxTemp : ${weatherModel.maxTemp.round()}'),
                        Text('MinTemp : ${weatherModel.minTemp.round()}'),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                weatherModel.weatherCondition,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
