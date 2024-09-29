import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/downloaded_book.dart';
import 'package:book_reader/features/my_books_bar/read_book/bloc/read_book_bloc.dart';
import 'package:book_reader/features/my_books_bar/read_book/widgets/epub_book_reader.dart';
import 'package:book_reader/features/my_books_bar/read_book/widgets/pdf_book_reader.dart';
import 'package:book_reader/ui/common/widgets/header_text.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReadBookScreen extends StatefulWidget {
  const ReadBookScreen({super.key, required this.book});
  final DownloadedBook book;
  @override
  State<ReadBookScreen> createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen>
    with WidgetsBindingObserver {
  late ReadBookBloc readBloc;

  @override
  Widget build(BuildContext context) {
    if (widget.book.storageLink.endsWith('epub')) {
      return EpubBookReader(book: widget.book);
    } else if (widget.book.storageLink.endsWith('pdf')) {
      return PdfBookReader(book: widget.book);
    }
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderText(text: 'К сожалению данный формат не поддерживается')
        ],
      ),
    );
  }
}
