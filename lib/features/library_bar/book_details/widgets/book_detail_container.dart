import 'package:book_reader/domain/models/book_detail.dart';
import 'package:book_reader/features/library_bar/book_details/widgets/book_detail_tile.dart';
import 'package:flutter/material.dart';

class BookDetailContainer extends StatelessWidget {
  const BookDetailContainer({
    super.key,
    required this.book,
  });
  final BookDetail book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BookDetailTile(
              title: 'Читателей',
              subtitle: book.readersCount.toString(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BookDetailTile(
              title: 'Год издания',
              subtitle: book.publishingYear.toString(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BookDetailTile(
              title: 'Рейтинг',
              subtitle: book.rating.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
