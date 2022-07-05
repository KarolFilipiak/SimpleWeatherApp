import 'package:flutter/material.dart';
import 'package:weather/home_page.dart';
import 'views/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:weather/sharedpreferences/shared_city_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

 void main()  {
  runApp(
    ChangeNotifierProvider<CitiesListModel>(
      create: (_) => CitiesListModel(),
      lazy: false,
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Weather app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color.fromARGB(255, 94, 3, 168),
          ),
          home: const HomePage(),
        );

 
  }
}