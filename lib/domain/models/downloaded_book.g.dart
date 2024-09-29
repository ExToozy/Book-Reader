// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_book.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class DownloadedBook extends _DownloadedBook
    with RealmEntity, RealmObjectBase, RealmObject {
  DownloadedBook(
    String id,
    String name,
    String imageLink,
    String author,
    String storageLink,
    String position,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'imageLink', imageLink);
    RealmObjectBase.set(this, 'author', author);
    RealmObjectBase.set(this, 'storageLink', storageLink);
    RealmObjectBase.set(this, 'position', position);
  }

  DownloadedBook._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get imageLink =>
      RealmObjectBase.get<String>(this, 'imageLink') as String;
  @override
  set imageLink(String value) => RealmObjectBase.set(this, 'imageLink', value);

  @override
  String get author => RealmObjectBase.get<String>(this, 'author') as String;
  @override
  set author(String value) => RealmObjectBase.set(this, 'author', value);

  @override
  String get storageLink =>
      RealmObjectBase.get<String>(this, 'storageLink') as String;
  @override
  set storageLink(String value) =>
      RealmObjectBase.set(this, 'storageLink', value);

  @override
  String get position =>
      RealmObjectBase.get<String>(this, 'position') as String;
  @override
  set position(String value) => RealmObjectBase.set(this, 'position', value);

  @override
  Stream<RealmObjectChanges<DownloadedBook>> get changes =>
      RealmObjectBase.getChanges<DownloadedBook>(this);

  @override
  DownloadedBook freeze() => RealmObjectBase.freezeObject<DownloadedBook>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(DownloadedBook._);
    return const SchemaObject(
        ObjectType.realmObject, DownloadedBook, 'DownloadedBook', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('imageLink', RealmPropertyType.string),
      SchemaProperty('author', RealmPropertyType.string),
      SchemaProperty('storageLink', RealmPropertyType.string),
      SchemaProperty('position', RealmPropertyType.string),
    ]);
  }
}
