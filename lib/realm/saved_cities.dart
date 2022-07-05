import 'package:realm/realm.dart';

part 'saved_cities.g.dart';

@RealmModel()
class _CityBase {
  @PrimaryKey()
  late String city;
  
  late bool top;
}