
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Clima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // Datos estáticos para el ejemplo
  String city = 'La Ceiba';
  double temperature = 33.0;
  String description = 'few clouds';
  IconData weatherIcon = FontAwesomeIcons.cloud;

  void _refreshWeather() {
    setState(() {
      
      Random random = Random();
      temperature = 20 + random.nextInt(15) + random.nextDouble(); 

     
      List<String> descriptions = [
        'clear sky',
        'few clouds',
        'scattered clouds',
        'broken clouds',
        'shower rain',
        'rain',
        'thunderstorm',
        'snow',
        'mist'
      ];
      description = descriptions[random.nextInt(descriptions.length)];

      
      switch (description) {
        case 'clear sky':
          weatherIcon = FontAwesomeIcons.sun;
          break;
        case 'few clouds':
        case 'scattered clouds':
        case 'broken clouds':
          weatherIcon = FontAwesomeIcons.cloud;
          break;
        case 'shower rain':
        case 'rain':
          weatherIcon = FontAwesomeIcons.cloudRain;
          break;
        case 'thunderstorm':
          weatherIcon = FontAwesomeIcons.pooStorm;
          break;
        case 'snow':
          weatherIcon = FontAwesomeIcons.snowflake;
          break;
        case 'mist':
          weatherIcon = FontAwesomeIcons.smog;
          break;
        default:
          weatherIcon = FontAwesomeIcons.cloud;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('El Clima'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ciudad: $city',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Temperatura: ${temperature.toStringAsFixed(1)}°C',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Descripción: $description',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Icon(
              weatherIcon,
              size: 100,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _refreshWeather,
              child: Text('Refrescar'),
            ),
          ],
        ),
      ),
    );
  }
}
