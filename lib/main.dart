import 'package:book_reader/data/books/repositories/book_repository.dart';
import 'package:book_reader/data/download/services/download_service.dart';
import 'package:book_reader/data/my_books/repositories/my_books_repository.dart';
import 'package:book_reader/data/quotes/repositories/quote_repository.dart';
import 'package:book_reader/data/search_history/repositories/search_history_repository.dart';
import 'package:book_reader/domain/models/downloaded_book.dart';
import 'package:book_reader/domain/models/quote.dart';
import 'package:book_reader/domain/models/search_history.dart';
import 'package:book_reader/features/library_bar/book_details/bloc/book_details_bloc.dart';
import 'package:book_reader/features/library_bar/books/bloc/books_bloc.dart';
import 'package:book_reader/features/library_bar/download/bloc/download_bloc.dart';
import 'package:book_reader/features/my_books_bar/my_books/bloc/my_books_bloc.dart';
import 'package:book_reader/features/my_books_bar/read_book/bloc/read_book_bloc.dart';
import 'package:book_reader/features/quotes_bar/quotes/bloc/quotes_bloc.dart';
import 'package:book_reader/router/router.dart';
import 'package:book_reader/ui/search/bloc/search_history_bloc.dart';
import 'package:book_reader/ui/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:realm/realm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = Configuration.local(
    [DownloadedBook.schema, Quote.schema, SearchHistory.schema],
    shouldDeleteIfMigrationNeeded: true,
  );
  final realm = Realm(config);
  await InAppWebViewController.setWebContentsDebuggingEnabled(true);
  await FlutterDownloader.initialize(debug: true, ignoreSsl: false);
  runApp(BookReaderApp(realm: realm));
}

class BookReaderApp extends StatefulWidget {
  const BookReaderApp({super.key, required this.realm});
  final Realm realm;
  @override
  State<BookReaderApp> createState() => _BookReaderAppState();
}

class _BookReaderAppState extends State<BookReaderApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BooksBloc(BookRepository()),
        ),
        BlocProvider(
          create: (context) => BookDetailsBloc(BookRepository()),
        ),
        BlocProvider(
          create: (context) => DownloadBloc(
            DownloadService(),
            MyBookRepository(realm: widget.realm),
          ),
        ),
        BlocProvider(
          create: (context) => MyBooksBloc(
            MyBookRepository(realm: widget.realm),
          ),
        ),
        BlocProvider(
          create: (context) => ReadBookBloc(
            MyBookRepository(realm: widget.realm),
            QuoteRepository(realm: widget.realm),
          ),
        ),
        BlocProvider(
          create: (context) => QuotesBloc(
            QuoteRepository(realm: widget.realm),
          ),
        ),
        BlocProvider(
          create: (context) => SearchHistoryBloc(
            SearchHistoryRepository(widget.realm),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'BookReader',
        theme: lightTheme,
        routerConfig: _router.config(),
      ),
    );
  }
}
