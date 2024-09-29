part of 'books_bloc.dart';

@freezed
class BooksEvent with _$BooksEvent {
  const factory BooksEvent.started() = _Started;
  const factory BooksEvent.load({required List<Book> books}) = _Load;
  const factory BooksEvent.search({required String query}) = _Search;
  const factory BooksEvent.searchGenre({required String genre}) = _SearchGenre;
}
