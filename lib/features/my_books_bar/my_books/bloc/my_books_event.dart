part of 'my_books_bloc.dart';

@freezed
class MyBooksEvent with _$MyBooksEvent {
  const factory MyBooksEvent.started() = _Started;
  const factory MyBooksEvent.newBookAdded() = _NewBookAdded;
  const factory MyBooksEvent.add() = _Add;
  const factory MyBooksEvent.delete({required DownloadedBook book}) = _Delete;
  const factory MyBooksEvent.search({required String query}) = _Search;
}
