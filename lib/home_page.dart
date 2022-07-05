// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:weather/views/cities_list.dart';
import 'package:weather/views/welcome_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late List<Widget> _pages;

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _pages = <Widget>[
      WelcomePage(), 
      CitiesList()
      ];

    print('init_home');
  }

  //var citiesToShow = ['Jarocin','Poznan','Olsztyn','Warsaw','Kent','Ankara','New York','Washington'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Cities',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
        /* children: [
          if (_selectedIndex == 0) ...[WeatherList()],
          if (_selectedIndex == 1) ...[CitiesList()],
          if (_selectedIndex == 2) ...[Settings()],
        ], */
      ),
    );
  }
}