import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('There is no Weather 😓', style: TextStyle(fontSize: 25)),
            Text('Start Searching Now 🔎', style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
