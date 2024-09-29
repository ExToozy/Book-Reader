import 'package:realm/realm.dart';

part 'search_history.g.dart';

@RealmModel()
class _SearchHistory {
  @PrimaryKey()
  late String id;
  late String query;
  late DateTime searchTime;
}
