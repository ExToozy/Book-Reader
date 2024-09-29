import 'package:book_reader/domain/models/search_history.dart';
import 'package:book_reader/domain/repositories/i_search_repository.dart';
import 'package:realm/realm.dart';

class SearchHistoryRepository implements ISearchHistoryRepository {
  SearchHistoryRepository(this.realm);

  final Realm realm;

  @override
  Future<void> addSearchHistory({required SearchHistory query}) async {
    realm.write(() {
      final results = realm.query<SearchHistory>("query == '${query.query}'");
      if (results.isEmpty) {
        realm.add(query);
      } else {
        results[0].searchTime = DateTime.now();
        realm.add<SearchHistory>(results[0], update: true);
      }
    });
  }

  @override
  Future<void> deleteSearchHistory({required SearchHistory query}) async {
    realm.write(() => realm.delete(query));
  }

  @override
  Future<List<SearchHistory>> getSearchHistory() async {
    return realm.all<SearchHistory>().toList();
  }
}
