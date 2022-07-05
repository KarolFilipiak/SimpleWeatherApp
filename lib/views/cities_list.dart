import 'package:weather/data/city_data.dart';
import 'package:weather/data/weather_getter.dart';
import 'package:weather/realm/saved_cities.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:weather/sharedpreferences/shared_city_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/views/city_details.dart';


class CitiesList extends StatefulWidget {
  const CitiesList({Key? key}) : super(key: key);

  @override
  State<CitiesList> createState() => _CitiesListState();
}

class _CitiesListState extends State<CitiesList> {
  bool _isLoading = true;
  List<String> _obj = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<CitiesListModel>(
      builder: ((context, model, child) {
      _obj = model.sharedCityList;
      
        return Scaffold(
          appBar: AppBar(
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.business),
              const SizedBox(width: 10),
              GestureDetector(
                child: const Text(
                  "SAVED CITIES",
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
                onDoubleTap: () async {
                  Uri url = Uri.parse("https://youtu.be/dQw4w9WgXcQ");
                  if (! await launchUrl(url)) print("link doesnt work");
                },
              ),
              const SizedBox(width: 10),
              const Icon(Icons.business),
            ]),
            backgroundColor: Color.fromARGB(255, 89, 7, 121),
            automaticallyImplyLeading: false,
          ),
          body: _isLoading 
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _obj.length + 1,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (index == 0)
                      Text(
                        'Your cities',
                        style: TextStyle(
                        fontSize: 40, 
                        fontFamily: "ComicSans",
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 200, 200, 200)
                      )),

                    if (index == 0) 
                      Text(
                        'Here you can chceck the weather of chosen city',
                        style: TextStyle(
                        fontSize: 15, 
                        fontFamily: "ComicSans",
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 200, 200, 200)
                      )),
                      SizedBox(height: 20,),

                    if (index > 0) 
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: Text(
                                _obj[index-1], 
                                style: TextStyle(
                                  fontSize: 15, 
                                  fontFamily: "ComicSans",
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 231, 123, 245)
                                ),
                            ),
                            ), 
                            TextButton(
                              onPressed: () async {
                                CityData weather = await WeatherApi.getWeather(null, _obj[index-1], true);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CityDetails(cityDet: weather,),
                                  ),
                                );
                                print('Delete ${_obj[index-1]}');
                              },
                              child: Text(
                                "SHOW WEATHER",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 241, 69, 247),
                                  fontFamily: "ComicSans",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                );
              }
            )
          );
        }
      ),
    );
  }
}
