// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart';

class CityData {
  late int? id;
  late String city_name;
  late num temperature;
  late String weather_condition;
  late String weatherIcon;

  late num rain_chance_today;
  late num temperature_today_min;
  late num temperature_today_avg;
  late num temperature_today_max;
  late String weather_condition_today;
  late String weatherIcon_today;

  late num rain_chance_tomorrow;
  late num temperature_tomorrow_min;
  late num temperature_tomorrow_avg;
  late num temperature_tomorrow_max;
  late String weather_condition_tomorrow;
  late String weatherIcon_tomorrow;

  late num rain_chance_2dayslater;
  late num temperature_2dayslater_min;
  late num temperature_2dayslater_avg;
  late num temperature_2dayslater_max;
  late String weather_condition_2dayslater;
  late String weatherIcon_2dayslater;

  late bool visibility;

  CityData(
      {
      this.id,
      required this.city_name,
      required this.temperature,
      required this.weather_condition,
      required this.weather_condition_today,
      required this.temperature_tomorrow_avg,
      required this.weather_condition_tomorrow,
      required this.temperature_2dayslater_avg,
      required this.weather_condition_2dayslater,
      required this.temperature_today_min,
      required this.temperature_today_avg,
      required this.weatherIcon_today,
      required this.rain_chance_today,
      required this.temperature_today_max,
      required this.temperature_tomorrow_min,
      required this.temperature_tomorrow_max,
      required this.rain_chance_tomorrow,
      required this.temperature_2dayslater_min,
      required this.temperature_2dayslater_max,
      required this.rain_chance_2dayslater,
      required this.weatherIcon_2dayslater,
      required this.weatherIcon,
      required this.weatherIcon_tomorrow,
      required this.visibility});

  factory CityData.fromJson(int? id, dynamic json, bool visibility) {
    return CityData(
        city_name: json["location"]["name"] as String,
        temperature_today_min:
            json["forecast"]["forecastday"][0]["day"]["mintemp_c"] as num,
        temperature_today_avg:
            json["forecast"]["forecastday"][0]["day"]["avgtemp_c"] as num,
        temperature: json["current"]["temp_c"] as num,
        temperature_today_max:
            json["forecast"]["forecastday"][0]["day"]["maxtemp_c"] as num,
        rain_chance_today: json["forecast"]["forecastday"][0]["day"]
            ["daily_chance_of_rain"] as num,
        weather_condition: json["current"]["condition"]["text"] as String,
        weather_condition_today: json["forecast"]["forecastday"][0]["day"]
            ["condition"]["text"] as String,
        temperature_tomorrow_min:
            json["forecast"]["forecastday"][1]["day"]["mintemp_c"] as num,
        temperature_tomorrow_avg:
            json["forecast"]["forecastday"][1]["day"]["avgtemp_c"] as num,
        temperature_tomorrow_max:
            json["forecast"]["forecastday"][1]["day"]["maxtemp_c"] as num,
        rain_chance_tomorrow: json["forecast"]["forecastday"][1]["day"]
            ["daily_chance_of_rain"] as num,
        weather_condition_tomorrow: json["forecast"]["forecastday"][1]["day"]
            ["condition"]["text"] as String,
        temperature_2dayslater_min:
            json["forecast"]["forecastday"][2]["day"]["mintemp_c"] as num,
        temperature_2dayslater_avg:
            json["forecast"]["forecastday"][2]["day"]["avgtemp_c"] as num,
        temperature_2dayslater_max:
            json["forecast"]["forecastday"][2]["day"]["maxtemp_c"] as num,
        rain_chance_2dayslater:
            json["forecast"]["forecastday"][0]["day"]["daily_chance_of_rain"] as num,
        weather_condition_2dayslater: json["forecast"]["forecastday"][2]["day"]["condition"]["text"] as String,
        weatherIcon: "https:" + json["current"]["condition"]["icon"] as String,
        weatherIcon_today: "https:" + json["forecast"]["forecastday"][0]["day"]
            ["condition"]["icon"] as String,
        weatherIcon_tomorrow: "https:" + json["forecast"]["forecastday"][1]["day"]
            ["condition"]["icon"] as String,
        weatherIcon_2dayslater: "https:" + json["forecast"]["forecastday"][2]["day"]
            ["condition"]["icon"] as String,
        visibility: visibility as bool);
  }

  static CityData cityDataFromSnapshot(int? id, dynamic snapshot, bool visibility) {
    return CityData.fromJson(id, snapshot, visibility);
  }

  @override
  String toString() {
    return 'Weather for $city_name: $weather_condition, $temperature C (tomorrow: $weather_condition_tomorrow, $temperature_tomorrow_avg C)(2 days later: $weather_condition_2dayslater, $temperature_2dayslater_avg C)';
  }
}
