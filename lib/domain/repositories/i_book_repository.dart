import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/domain/models/book_detail.dart';

abstract interface class IBookRepository {
  Future<List<Book>> getBooks({
    required int page,
    String? query,
    String? genre,
  });

  Future<BookDetail> getBookDetail({required Book book});
}
