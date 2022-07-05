import 'package:flutter/material.dart';
import 'city_search/welcome_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

 

  runApp(const MyApp());
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
        scaffoldBackgroundColor: Colors.greenAccent,
      ),
      home: const WelcomePage(),
    );
  }
}
