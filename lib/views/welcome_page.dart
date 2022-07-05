
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.search),
          const SizedBox(width: 10),
          GestureDetector(
            child: const Text(
              "SEARCH",
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
            onDoubleTap: () async {
              Uri url = Uri.parse("https://youtu.be/dQw4w9WgXcQ");
              if (! await launchUrl(url)) print("link doesnt work");
            },
          ),
          const SizedBox(width: 10),
          const Icon(Icons.search),
        ]),
        backgroundColor: Color.fromARGB(255, 89, 7, 121),
        automaticallyImplyLeading: false,
      ),
      body: _isLoading
      ? Center(
          child: CircularProgressIndicator(),
        )
      : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome to my app!', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 200, 200, 200))),
            const Text('Type city name and tap a button to start', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 200, 200, 200))),
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
                  FocusManager.instance.primaryFocus?.unfocus();
                  sleep(Duration(milliseconds: 100));
                  
                  setState(() {
                    _isLoading = false;
                  });
                  
                  CityData weather = await WeatherApi.getWeather(null, city, true);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CityDetails(cityDet: weather,),
                    ),
                  );
                  setState(() {
                    city = '';
                    fieldTextControl.clear();
                    _isLoading = false;
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
