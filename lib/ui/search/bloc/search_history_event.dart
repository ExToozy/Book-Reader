part of 'search_history_bloc.dart';

@freezed
class SearchHistoryEvent with _$SearchHistoryEvent {
  const factory SearchHistoryEvent.started() = _Started;
  const factory SearchHistoryEvent.add({required String query}) = _Add;
  const factory SearchHistoryEvent.delete({required SearchHistory query}) =
      _Delete;
}
