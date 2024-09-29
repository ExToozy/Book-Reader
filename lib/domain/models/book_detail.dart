import 'package:book_reader/domain/models/book.dart';

class BookDetail extends Book {
  BookDetail({
    required super.name,
    required super.author,
    required super.imageLink,
    super.selfLink,
    required this.paragraphs,
    required this.readersCount,
    required this.publishingYear,
    required this.rating,
    required this.downloadLink,
  });
  final int readersCount;
  final List<String> paragraphs;
  final int publishingYear;
  final double rating;
  final String downloadLink;
}
