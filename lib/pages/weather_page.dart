import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tempapp/services/weather_service.dart';

import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService =
      WeatherService(const String.fromEnvironment('API_KEY'));
  Weather? _weather;

  // metodo para buscar o clima
  _fetchWeather() async {
    // cidade atual
    String cityName = await _weatherService.getCurrentCity();

    // clima da cidade
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    // erros
    catch (erros) {
      print(erros);
    }
  }

  // animações do clima
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sol.json'; // padrão é ensolarado

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/solchuva.sjon';
      case 'thunderstorm':
        return 'assets/tempestade';
      case 'clear':
        return 'assets/sol.json';
      default:
        return 'assets/sol.json';
    }
  }

  // iniciar estado
  @override
  void initState() {
    super.initState();

    // pega o clima quando inicia
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // nome da cidade
            Text(_weather?.cityName ?? "Carregando cidade..."),

            // animação
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            // temperatura
            Text('${_weather?.temperature.round()}°C'),

            // condição do clima
            Text(_weather?.mainCondition ?? "")
          ],
        ),
      ),
    );
  }
}
