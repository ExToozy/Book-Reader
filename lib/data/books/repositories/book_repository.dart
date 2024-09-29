import 'package:book_reader/data/books/api/books_api.dart';
import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/domain/models/book_detail.dart';
import 'package:book_reader/domain/repositories/i_book_repository.dart';

class BookRepository implements IBookRepository {
  final booksApi = BooksApi();

  @override
  Future<List<Book>> getBooks(
      {required int page, String? query, String? genre}) async {
    return booksApi.getBooks(page, query, genre);
  }

  @override
  Future<BookDetail> getBookDetail({required Book book}) {
    return booksApi.getBookDetail(book);
  }
}
