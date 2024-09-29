part of 'quotes_bloc.dart';

@freezed
class QuotesEvent with _$QuotesEvent {
  const factory QuotesEvent.load() = _Started;
  const factory QuotesEvent.search({required String query}) = _Search;
  const factory QuotesEvent.delete({required Quote quote}) = _Delete;
}
