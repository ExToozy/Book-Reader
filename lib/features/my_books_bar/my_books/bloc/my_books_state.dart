part of 'my_books_bloc.dart';

@freezed
class MyBooksState with _$MyBooksState {
  const factory MyBooksState.initial() = _Initial;
  const factory MyBooksState.loading() = _Loading;
  const factory MyBooksState.loaded({
    required List<DownloadedBook> books,
  }) = _Loaded;
  const factory MyBooksState.failure({required Object error}) = _Failure;
}
