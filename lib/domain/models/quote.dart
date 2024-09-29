import 'package:realm/realm.dart';

part 'quote.g.dart';

@RealmModel()
class _Quote {
  late String quote;
  late String author;
  late String bookName;
}
