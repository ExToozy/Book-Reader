part of 'search_history_bloc.dart';

@freezed
class SearchHistoryState with _$SearchHistoryState {
  const factory SearchHistoryState.initial() = _Initial;
  const factory SearchHistoryState.loading() = _Loading;
  const factory SearchHistoryState.loaded(
      {required List<SearchHistory> history}) = _Loaded;
  const factory SearchHistoryState.failure() = _Failure;
}
