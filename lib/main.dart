import 'dart:convert';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_weather/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '天气App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('长春')),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  /// 当前天气数据, 如果为null则表示没有获取到数据
  Weather? _weather;

  /// 是否正在获取天气数据
  var _isLoading = false;

  Future<void> update() async {
    setState(() => _isLoading = true);
    try {
      await updateWeather();
    } catch (e) {
      rethrow;
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> updateWeather() async {
    final url = Uri.parse('https://cust.app/app/weather');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final weather = Weather.fromJson(json.decode(response.body)['data']);
      setState(() => _weather = weather);
    }
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    await update();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_weather == null) {
      return const Center(
        child: Text('没有获取到天气数据'),
      );
    }

    return WeatherWidget(weather: _weather!);
  }
}

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
