// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class SearchHistory extends _SearchHistory
    with RealmEntity, RealmObjectBase, RealmObject {
  SearchHistory(
    String id,
    String query,
    DateTime searchTime,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'query', query);
    RealmObjectBase.set(this, 'searchTime', searchTime);
  }

  SearchHistory._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get query => RealmObjectBase.get<String>(this, 'query') as String;
  @override
  set query(String value) => RealmObjectBase.set(this, 'query', value);

  @override
  DateTime get searchTime =>
      RealmObjectBase.get<DateTime>(this, 'searchTime') as DateTime;
  @override
  set searchTime(DateTime value) =>
      RealmObjectBase.set(this, 'searchTime', value);

  @override
  Stream<RealmObjectChanges<SearchHistory>> get changes =>
      RealmObjectBase.getChanges<SearchHistory>(this);

  @override
  SearchHistory freeze() => RealmObjectBase.freezeObject<SearchHistory>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(SearchHistory._);
    return const SchemaObject(
        ObjectType.realmObject, SearchHistory, 'SearchHistory', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('query', RealmPropertyType.string),
      SchemaProperty('searchTime', RealmPropertyType.timestamp),
    ]);
  }
}
