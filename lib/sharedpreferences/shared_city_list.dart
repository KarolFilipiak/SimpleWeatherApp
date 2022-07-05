import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CitiesListModel extends ChangeNotifier {
  List<String> _sharedCityList = [];

  CitiesListModel() {
    SharedPreferences.getInstance().then((prefs) {
      _sharedCityList = prefs.getStringList('savedCities') ?? [];
      notifyListeners();
    });
  }

  Future<void> _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('savedCities', _sharedCityList);
  }

  Future<void> toggleList(name) async {
    if (_sharedCityList.contains(name)) {
      _sharedCityList.remove(name);
    } else {
      _sharedCityList.add(name);
    }

    _setPrefItems();
    notifyListeners();
  }

  List<String> get sharedCityList => _sharedCityList;
}
