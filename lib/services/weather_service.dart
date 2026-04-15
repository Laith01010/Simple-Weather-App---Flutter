import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '157c304976fa4875a2e114800262303';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );

      WeatherModel weatherModel = WeatherModel.fromJSON(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops there was an error LOL';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error..');
    }
  }
}
