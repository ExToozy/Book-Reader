import 'package:book_reader/domain/models/downloaded_book.dart';
import 'package:book_reader/domain/repositories/i_my_book_repository.dart';
import 'package:realm/realm.dart';

class MyBookRepository implements IMyBooksRepository {
  MyBookRepository({required this.realm});
  final Realm realm;

  @override
  Future<void> addBook(DownloadedBook book) async {
    realm.write(() => realm.add(book));
  }

  @override
  Future<void> deleteBook(DownloadedBook book) async {
    realm.write(() => realm.delete(book));
  }

  @override
  Future<List<DownloadedBook>> getBooks({String? query}) async {
    List<DownloadedBook> books = realm.all<DownloadedBook>().toList();
    List<DownloadedBook> fondedBooks = [];
    if (query != null) {
      for (var element in books) {
        if (element.name.toLowerCase().contains(query)) {
          fondedBooks.add(element);
        }
      }
    }
    if (query?.isNotEmpty ?? false) {
      return fondedBooks;
    }
    return books;
  }

  Future<void> updateBookCfi(DownloadedBook book, String bookCfi) async {
    if (bookCfi.isNotEmpty) {
      realm.write(() => book);
    }
  }
}
