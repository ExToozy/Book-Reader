import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/router/router.dart';
import 'package:book_reader/ui/common/widgets/book_card.dart';
import 'package:flutter/material.dart';

class BooksSliverGrid extends StatefulWidget {
  const BooksSliverGrid({
    super.key,
    required this.books,
  });

  final List<Book> books;

  @override
  State<BooksSliverGrid> createState() => _BooksSliverGridState();
}

class _BooksSliverGridState extends State<BooksSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 0.5,
      ),
      itemBuilder: (context, index) {
        return BookCard(
          onTap: () => AutoRouter.of(context).navigate(
            BookDetailsRoute(book: widget.books[index]),
          ),
          book: widget.books[index],
        );
      },
      itemCount: widget.books.length,
    );
  }
}
