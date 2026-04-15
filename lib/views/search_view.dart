import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search a City')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 25,
              ),
              border: OutlineInputBorder(),
              hintText: 'Enter City Name',
              label: Text('Search'),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
