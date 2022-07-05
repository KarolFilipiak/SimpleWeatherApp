import 'package:flutter/material.dart';
import 'package:weather/views/city_details.dart';
import 'package:weather/data/weather_getter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:weather/data/city_data.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final fieldTextControl = TextEditingController();
  String city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome', style: TextStyle(fontSize: 40)),
            const SizedBox(
              height: 20,
            ),
            
            SizedBox(
              width: 150,
              height: 40,
              child: TextField(
                onChanged: (var value) {
                  setState(() {
                    city = value;
                  });
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "City Name",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 8, right: 8, bottom: 8)),
                controller: fieldTextControl,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (city.length < 1) 
                {
                  showTopSnackBar(
                    context,
                    CustomSnackBar.info(
                      message:
                          "Please type a city name",
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
                else
                {
                  CityData weather = await WeatherApi.getWeather(null, city, true);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CityDetails(cityDet: weather,),
                    ),
                  );
                  setState(() {
                    fieldTextControl.clear();
                    city = '';
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(180, 50),
                primary: Colors.redAccent,
              ),
              child: const Text(
                'Show weather',
                style: TextStyle(fontFamily: 'ComicSans'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
