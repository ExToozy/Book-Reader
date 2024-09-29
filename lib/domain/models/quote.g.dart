// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Quote extends _Quote with RealmEntity, RealmObjectBase, RealmObject {
  Quote(
    String quote,
    String author,
    String bookName,
  ) {
    RealmObjectBase.set(this, 'quote', quote);
    RealmObjectBase.set(this, 'author', author);
    RealmObjectBase.set(this, 'bookName', bookName);
  }

  Quote._();

  @override
  String get quote => RealmObjectBase.get<String>(this, 'quote') as String;
  @override
  set quote(String value) => RealmObjectBase.set(this, 'quote', value);

  @override
  String get author => RealmObjectBase.get<String>(this, 'author') as String;
  @override
  set author(String value) => RealmObjectBase.set(this, 'author', value);

  @override
  String get bookName =>
      RealmObjectBase.get<String>(this, 'bookName') as String;
  @override
  set bookName(String value) => RealmObjectBase.set(this, 'bookName', value);

  @override
  Stream<RealmObjectChanges<Quote>> get changes =>
      RealmObjectBase.getChanges<Quote>(this);

  @override
  Quote freeze() => RealmObjectBase.freezeObject<Quote>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Quote._);
    return const SchemaObject(ObjectType.realmObject, Quote, 'Quote', [
      SchemaProperty('quote', RealmPropertyType.string),
      SchemaProperty('author', RealmPropertyType.string),
      SchemaProperty('bookName', RealmPropertyType.string),
    ]);
  }
}
