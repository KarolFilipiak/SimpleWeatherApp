// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_cities.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class CityBase extends _CityBase with RealmEntity, RealmObject {
  CityBase(
    String city,
    bool top,
  ) {
    RealmObject.set(this, 'city', city);
    RealmObject.set(this, 'top', top);
  }

  CityBase._();

  @override
  String get city => RealmObject.get<String>(this, 'city') as String;
  @override
  set city(String value) => throw RealmUnsupportedSetError();

  @override
  bool get top => RealmObject.get<bool>(this, 'top') as bool;
  @override
  set top(bool value) => RealmObject.set(this, 'top', value);

  @override
  Stream<RealmObjectChanges<CityBase>> get changes =>
      RealmObject.getChanges<CityBase>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(CityBase._);
    return const SchemaObject(CityBase, 'CityBase', [
      SchemaProperty('city', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('top', RealmPropertyType.bool),
    ]);
  }
}
