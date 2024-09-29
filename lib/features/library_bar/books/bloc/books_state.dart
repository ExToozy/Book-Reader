part of 'books_bloc.dart';

@freezed
class BooksState with _$BooksState {
  const BooksState._();
  const factory BooksState.initial() = _Initial;

  const factory BooksState.loading({
    required String query,
    required String genre,
    required int page,
    required List<Book> books,
  }) = _Loading;

  const factory BooksState.loaded({
    required String query,
    required String genre,
    required int page,
    required List<Book> books,
  }) = _Loaded;

  const factory BooksState.failure({
    required String query,
    required String genre,
    required int page,
    required Object error,
  }) = _Failure;

  int get page => map(
        initial: (s) => 0,
        loading: (s) => s.page,
        failure: (s) => s.page,
        loaded: (s) => s.page,
      );

  List<Book> get books => map(
        initial: (_) => [],
        loading: (s) => s.books,
        failure: (s) => s.books,
        loaded: (s) => s.books,
      );

  String get query => map(
        initial: (_) => '',
        loading: (s) => s.query,
        failure: (s) => s.query,
        loaded: (s) => s.query,
      );
  String get genre => map(
        initial: (_) => '',
        loading: (s) => s.genre,
        failure: (s) => s.genre,
        loaded: (s) => s.genre,
      );
}
