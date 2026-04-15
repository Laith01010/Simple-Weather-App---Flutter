import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  state is WeatherLoadedState
                      ? state.weatherModel.weatherCondition
                      : null,
                ),
              ),
              home: HomeView(),
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    // ☀️ Clear / Sunny
    case 'Sunny':
    case 'Clear':
      return Colors.orange;

    // ⛅ Partly cloudy
    case 'Partly cloudy':
      return Colors.lightBlue;

    // ☁️ Cloudy / Overcast
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;

    // 🌫 Mist / Fog
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    // 🌦 Light rain / drizzle
    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Light rain shower':
      return Colors.lightBlue;

    // 🌧 Moderate rain
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Moderate or heavy rain shower':
      return Colors.blue;

    // 🌧 Heavy rain
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Torrential rain shower':
      return Colors.indigo;

    // ❄️ Snow (light/moderate)
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Light snow showers':
      return Colors.cyan;

    // ❄️ Heavy snow / blizzard
    case 'Blowing snow':
    case 'Blizzard':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Moderate or heavy snow showers':
      return Colors.blueGrey;

    // 🧊 Ice / sleet / freezing
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Ice pellets':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.teal;

    // ⚡ Thunder
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;

    // default fallback
    default:
      return Colors.blue;
  }
}
