import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather/data/city_data.dart';

class WeatherApi {
  static Future<CityData> getWeather(int? id, String city, bool visibility) async {
    var url = Uri.http('api.weatherapi.com', '/v1/forecast.json',
        {'key': '65e07152122c4164944214950222806', 'q': city, 'days': '3', 'aqi': 'no', 'alerts': 'no'});

    final result = await http.get(url);

    var kod = result.statusCode;
    print('Response code: $kod');
    Map data = json.decode(result.body);
    
    if (kod == 200)
      return CityData.cityDataFromSnapshot(id, data, visibility);
    else
      return CityData(city_name: city, temperature: 0.0, weather_condition: "ERR", weather_condition_today: "weather_condition_today", temperature_tomorrow_avg: 0.0, weather_condition_tomorrow: "weather_condition_tomorrow", temperature_2dayslater_avg: 0.0, weather_condition_2dayslater: "weather_condition_2dayslater", temperature_today_min: 0.0, temperature_today_avg: 0.0, rain_chance_today: 0.0, temperature_today_max: 0.0, temperature_tomorrow_min: 0.0, temperature_tomorrow_max: 0.0, rain_chance_tomorrow: 0.0, temperature_2dayslater_min: 0.0, temperature_2dayslater_max: 0.0, rain_chance_2dayslater: 0.0, visibility: true, weatherIcon_2dayslater: 'https://live.staticflickr.com/246/453349464_0dc724aa99_b.jpg', weatherIcon_today: 'https://live.staticflickr.com/246/453349464_0dc724aa99_b.jpg', weatherIcon_tomorrow: 'https://live.staticflickr.com/246/453349464_0dc724aa99_b.jpg', weatherIcon: 'https://live.staticflickr.com/246/453349464_0dc724aa99_b.jpg');
  }
}