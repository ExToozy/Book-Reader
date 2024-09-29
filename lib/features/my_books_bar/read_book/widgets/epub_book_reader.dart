import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/downloaded_book.dart';
import 'package:book_reader/features/my_books_bar/read_book/bloc/read_book_bloc.dart';
import 'package:book_reader/router/router.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpubBookReader extends StatefulWidget {
  const EpubBookReader({
    super.key,
    required this.book,
  });

  final DownloadedBook book;

  @override
  State<EpubBookReader> createState() => _EpubBookReaderState();
}

class _EpubBookReaderState extends State<EpubBookReader> {
  late EpubController _epubReaderController;
  SelectedContent? _selection;
  @override
  void initState() {
    _epubReaderController = EpubController(
      document: EpubDocument.openFile(File(widget.book.storageLink)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: EpubViewActualChapter(
          loader: null,
          controller: _epubReaderController,
          builder: (chapterValue) => Text(
            chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? '',
            textAlign: TextAlign.start,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              AutoRouter.of(context).navigate(const MyBooksRoute());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: EpubViewTableOfContents(controller: _epubReaderController),
      ),
      body: SelectionArea(
        onSelectionChanged: (selection) {
          _selection = selection;
        },
        contextMenuBuilder: (
          BuildContext context,
          SelectableRegionState selectableRegionState,
        ) {
          return AdaptiveTextSelectionToolbar.buttonItems(
            anchors: selectableRegionState.contextMenuAnchors,
            buttonItems: <ContextMenuButtonItem>[
              ...selectableRegionState.contextMenuButtonItems,
              ContextMenuButtonItem(
                onPressed: () {
                  ContextMenuController.removeAny();
                  BlocProvider.of<ReadBookBloc>(context).add(
                    ReadBookEvent.addQuote(
                      book: widget.book,
                      quote: _selection!.plainText,
                    ),
                  );
                },
                label: 'Добавить в цитаты',
              ),
            ],
          );
        },
        child: EpubView(
          builders: EpubViewBuilders<DefaultBuilderOptions>(
            loaderBuilder: (context) => const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
            options: const DefaultBuilderOptions(),
            chapterDividerBuilder: (_) => const Divider(),
          ),
          controller: _epubReaderController,
          onChapterChanged: (_) {
            BlocProvider.of<ReadBookBloc>(context).add(
              ReadBookEvent.updateBookCfi(
                cfi: _epubReaderController.generateEpubCfi() ?? '',
                book: widget.book,
              ),
            );
          },
        ),
      ),
    );
  }
}
