import 'package:book_reader/domain/models/downloaded_book.dart';

abstract interface class IMyBooksRepository {
  Future<List<DownloadedBook>> getBooks({String? query});
  Future<void> addBook(DownloadedBook book);
  Future<void> deleteBook(DownloadedBook book);
}
