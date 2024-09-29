import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/downloaded_book.dart';
import 'package:book_reader/features/my_books_bar/my_books/bloc/my_books_bloc.dart';
import 'package:book_reader/router/router.dart';
import 'package:book_reader/ui/common/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBooksSliverGrid extends StatefulWidget {
  const MyBooksSliverGrid({
    super.key,
    required this.books,
  });

  final List<DownloadedBook> books;

  @override
  State<MyBooksSliverGrid> createState() => _MyBooksSliverGridState();
}

class _MyBooksSliverGridState extends State<MyBooksSliverGrid> {
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
          onDeleteTap: () => BlocProvider.of<MyBooksBloc>(context).add(
            MyBooksEvent.delete(book: widget.books[index]),
          ),
          onTap: () => AutoRouter.of(context).navigate(
            ReadBookRoute(book: widget.books[index]),
          ),
          isLocalSaved: true,
          book: widget.books[index].toBook(),
        );
      },
      itemCount: widget.books.length,
    );
  }
}
