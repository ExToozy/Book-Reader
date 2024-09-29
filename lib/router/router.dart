import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/domain/models/book_detail.dart';
import 'package:book_reader/domain/models/downloaded_book.dart';
import 'package:book_reader/features/home/view/home_screen.dart';
import 'package:book_reader/features/library_bar/book_details/view/book_details_screen.dart';
import 'package:book_reader/features/library_bar/books/view/books_screen.dart';
import 'package:book_reader/features/library_bar/download/view/download_screen.dart';
import 'package:book_reader/features/my_books_bar/my_books/view/my_books_screen.dart';
import 'package:book_reader/features/my_books_bar/read_book/view/read_book_screen.dart';
import 'package:book_reader/features/quotes_bar/book_quotes/view/book_quotes_screen.dart';
import 'package:book_reader/features/quotes_bar/quotes/view/quotes_screen.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(page: QuotesRoute.page, path: 'quotes'),
            AutoRoute(page: MyBooksRoute.page, path: 'my_books'),
            AutoRoute(page: BooksRoute.page, path: 'download_books'),
          ],
        ),
        AutoRoute(page: DownloadRoute.page, path: '/download'),
        AutoRoute(page: ReadBookRoute.page, path: '/read_book'),
        AutoRoute(page: BookDetailsRoute.page, path: '/book_details'),
        AutoRoute(page: BookQuotesRoute.page, path: '/book_quotes'),
      ];
}
