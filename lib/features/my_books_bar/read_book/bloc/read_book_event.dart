part of 'read_book_bloc.dart';

@freezed
class ReadBookEvent with _$ReadBookEvent {
  const factory ReadBookEvent.updateBookCfi({
    required String cfi,
    required DownloadedBook book,
  }) = _UpdateBookCfi;
  const factory ReadBookEvent.addQuote(
      {required DownloadedBook book, required String quote}) = _AddQuote;
}
