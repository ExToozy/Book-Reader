import 'dart:async';
import 'dart:developer';

import 'package:book_reader/domain/models/downloaded_book.dart';
import 'package:book_reader/features/my_books_bar/read_book/bloc/read_book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfBookReader extends StatefulWidget {
  const PdfBookReader({
    super.key,
    required this.book,
  });

  final DownloadedBook book;
  @override
  State<PdfBookReader> createState() => _PdfBookReaderState();
}

class _PdfBookReaderState extends State<PdfBookReader> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PDFView(
        defaultPage:
            widget.book.position.isEmpty ? 0 : int.parse(widget.book.position),
        filePath: widget.book.storageLink,
        enableSwipe: true,
        pageFling: true,
        autoSpacing: false,
        onRender: (pages) {
          setState(() {
            pages = pages;
            isReady = true;
          });
        },
        onError: (error) {
          log(error.toString());
        },
        onPageError: (page, error) {
          log('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          _controller.complete(pdfViewController);
        },
        onPageChanged: (page, total) {
          BlocProvider.of<ReadBookBloc>(context).add(
            ReadBookEvent.updateBookCfi(
              cfi: page?.toString() ?? '0',
              book: widget.book,
            ),
          );
        },
      ),
    );
  }
}
