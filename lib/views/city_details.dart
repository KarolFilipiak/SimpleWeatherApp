import 'dart:math';

import 'package:flutter/material.dart';
import '../data/city_data.dart';
import 'package:weather_icons/weather_icons.dart';

class CityDetails extends StatefulWidget {
  final CityData cityDet;

  const CityDetails({Key? key, required this.cityDet}) : super(key: key);

  @override
  State<CityDetails> createState() => _CityDetailsState();
}

class _CityDetailsState extends State<CityDetails> {
  int mode = 0;
  num skala1 = 0.3;

  @override
  Widget build(BuildContext context) {
    String cityName = widget.cityDet.city_name;

    late num cityTemp;
    late String cityCond;
    late String cityWeatherIcon;
    late num cityTempMin;
    late num cityTempMax;
    late num cityTempAvg;
    late num cityRainChance;

    if (mode == 0) {
      cityTemp = widget.cityDet.temperature;
      cityCond = widget.cityDet.weather_condition;
      cityWeatherIcon = widget.cityDet.weatherIcon;

      cityTempMin = 0;
      cityTempMax = 0;
      cityTempAvg = 0;
      cityRainChance = 0;
    } else if (mode == 1) {
      cityTemp = 0;
      cityCond = widget.cityDet.weather_condition_today;
      cityWeatherIcon = widget.cityDet.weatherIcon_today;

      cityTempMin = widget.cityDet.temperature_today_min;
      cityTempMax = widget.cityDet.temperature_today_max;
      cityTempAvg = widget.cityDet.temperature_today_avg;
      cityRainChance = widget.cityDet.rain_chance_today;
    } else if (mode == 2) {
      cityTemp = 0;
      cityCond = widget.cityDet.weather_condition_tomorrow;
      cityWeatherIcon = widget.cityDet.weatherIcon_tomorrow;

      cityTempMin = widget.cityDet.temperature_tomorrow_min;
      cityTempMax = widget.cityDet.temperature_tomorrow_max;
      cityTempAvg = widget.cityDet.temperature_tomorrow_avg;
      cityRainChance = widget.cityDet.rain_chance_tomorrow;
    } else {
      cityTemp = 0;
      cityCond = widget.cityDet.weather_condition_2dayslater;
      cityWeatherIcon = widget.cityDet.weatherIcon_2dayslater;

      cityTempMin = widget.cityDet.temperature_2dayslater_min;
      cityTempMax = widget.cityDet.temperature_2dayslater_max;
      cityTempAvg = widget.cityDet.temperature_2dayslater_avg;
      cityRainChance = widget.cityDet.rain_chance_2dayslater;
    }

    void _onItemTapped(int index) {
      setState(() {
        mode = index;
      });
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.greenAccent,
        body: mode == 0
            ? Container(
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.only(right: 12, left: 12, top: 12),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.8,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            cityName,
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    min(size.width * 0.1, size.height * 0.1),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => _onItemTapped(0),
                                child: Text("Teraz"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _onItemTapped(1),
                                child: Text("Dzisiaj"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _onItemTapped(2),
                                child: Text("Jutro"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _onItemTapped(3),
                                child: Text("Pojutrze"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Spacer(flex: 1,),
                          Image.network(
                            cityWeatherIcon,
                            height: min(size.width * 0.2, size.height * 0.2),
                            width: min(size.width * 0.2, size.height * 0.2),
                            fit: BoxFit.contain,
                          ),
                          Text("Obecna pogoda:",
                              style: TextStyle(
                                  fontSize: min(
                                      size.width * 0.04, size.height * 0.04),
                                  fontWeight: FontWeight.w600)),
                          Text(cityCond.toString(),
                              style: TextStyle(
                                  fontSize: min(
                                      size.width * 0.04, size.height * 0.04),
                                  fontWeight: FontWeight.w600)),
                          Spacer(flex: 2,),
                          SizedBox(
                              height:
                                  min(size.width * 0.03, size.height * 0.03)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.thermostat,
                                  size: min(
                                      size.width * 0.2, size.height * 0.2)),
                              Text("Temperatura: " + cityTemp.toString() + " C",
                                  style: TextStyle(
                                      fontSize: min(size.width * 0.04,
                                          size.height * 0.04),
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Spacer(flex: 2,),
                          SizedBox(
                            height: min(size.width * 0.16, size.height * 0.15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.only(right: 12, left: 12, top: 12),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.8,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            cityName,
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    min(size.width * 0.1, size.height * 0.1),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => _onItemTapped(0),
                                child: Text("Teraz"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _onItemTapped(1),
                                child: Text("Dzisiaj"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _onItemTapped(2),
                                child: Text("Jutro"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _onItemTapped(3),
                                child: Text("Pojutrze"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Spacer(flex: 1,),
                          Image.network(
                            cityWeatherIcon,
                            height: min(size.width * 0.2, size.height * 0.2),
                            width: min(size.width * 0.2, size.height * 0.2),
                            fit: BoxFit.contain,
                          ),
                          Text("Przewidywana pogoda:",
                              style: TextStyle(
                                  fontSize: min(
                                      size.width * 0.04, size.height * 0.04),
                                  fontWeight: FontWeight.w600)),
                          Text(cityCond.toString(),
                              style: TextStyle(
                                  fontSize: min(
                                      size.width * 0.04, size.height * 0.04),
                                  fontWeight: FontWeight.w600)),
                          Spacer(flex: 2,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(WeatherIcons.raindrops,
                                  size: min(
                                      size.width * 0.2, size.height * 0.2)),
                              Text(
                                  "Szansa opadow: " +
                                      cityRainChance.toString() +
                                      "%",
                                  style: TextStyle(
                                      fontSize: min(size.width * 0.04,
                                          size.height * 0.04),
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Spacer(flex: 2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    WeatherIcons.snowflake_cold,
                                    size: min(
                                        size.width * 0.06, size.height * 0.05),
                                  ),
                                  SizedBox(
                                      height: min(size.width * 0.03,
                                          size.height * 0.03)),
                                  Text("Temp. min.: " + cityTempMin.toString() + "°C",
                                      style: TextStyle(
                                          fontSize: min(size.width * 0.03,
                                              size.height * 0.03),
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.scale,
                                      size: min(size.width * 0.06,
                                          size.height * 0.05)),
                                  SizedBox(
                                      height: min(size.width * 0.03,
                                          size.height * 0.03)),
                                  Text("Temp. avg.: " + cityTempAvg.toString() + "°C",
                                      style: TextStyle(
                                          fontSize: min(size.width * 0.03,
                                            size.height * 0.03),
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(WeatherIcons.day_sunny,
                                      size: min(size.width * 0.06,
                                          size.height * 0.05)),
                                  SizedBox(
                                      height: min(size.width * 0.03,
                                          size.height * 0.03)),
                                  Text("Temp. max.: " + cityTempMax.toString() + "°C",
                                      style: TextStyle(
                                          fontSize: min(size.width * 0.03,
                                              size.height * 0.03),
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: min(size.width * 0.04,
                                size.height * 0.04)),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}