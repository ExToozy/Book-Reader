import 'package:book_reader/domain/models/search_history.dart';

abstract interface class ISearchHistoryRepository {
  Future<List<SearchHistory>> getSearchHistory();
  Future<void> addSearchHistory({required SearchHistory query});
  Future<void> deleteSearchHistory({required SearchHistory query});
}
