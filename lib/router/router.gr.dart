// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BookDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BookDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookDetailsScreen(
          key: args.key,
          book: args.book,
        ),
      );
    },
    BookQuotesRoute.name: (routeData) {
      final args = routeData.argsAs<BookQuotesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookQuotesScreen(
          key: args.key,
          book: args.book,
        ),
      );
    },
    BooksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BooksScreen(),
      );
    },
    DownloadRoute.name: (routeData) {
      final args = routeData.argsAs<DownloadRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DownloadScreen(
          key: args.key,
          book: args.book,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MyBooksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyBooksScreen(),
      );
    },
    QuotesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuotesScreen(),
      );
    },
    ReadBookRoute.name: (routeData) {
      final args = routeData.argsAs<ReadBookRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReadBookScreen(
          key: args.key,
          book: args.book,
        ),
      );
    },
  };
}

/// generated route for
/// [BookDetailsScreen]
class BookDetailsRoute extends PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({
    Key? key,
    required Book book,
    List<PageRouteInfo>? children,
  }) : super(
          BookDetailsRoute.name,
          args: BookDetailsRouteArgs(
            key: key,
            book: book,
          ),
          initialChildren: children,
        );

  static const String name = 'BookDetailsRoute';

  static const PageInfo<BookDetailsRouteArgs> page =
      PageInfo<BookDetailsRouteArgs>(name);
}

class BookDetailsRouteArgs {
  const BookDetailsRouteArgs({
    this.key,
    required this.book,
  });

  final Key? key;

  final Book book;

  @override
  String toString() {
    return 'BookDetailsRouteArgs{key: $key, book: $book}';
  }
}

/// generated route for
/// [BookQuotesScreen]
class BookQuotesRoute extends PageRouteInfo<BookQuotesRouteArgs> {
  BookQuotesRoute({
    Key? key,
    required Book book,
    List<PageRouteInfo>? children,
  }) : super(
          BookQuotesRoute.name,
          args: BookQuotesRouteArgs(
            key: key,
            book: book,
          ),
          initialChildren: children,
        );

  static const String name = 'BookQuotesRoute';

  static const PageInfo<BookQuotesRouteArgs> page =
      PageInfo<BookQuotesRouteArgs>(name);
}

class BookQuotesRouteArgs {
  const BookQuotesRouteArgs({
    this.key,
    required this.book,
  });

  final Key? key;

  final Book book;

  @override
  String toString() {
    return 'BookQuotesRouteArgs{key: $key, book: $book}';
  }
}

/// generated route for
/// [BooksScreen]
class BooksRoute extends PageRouteInfo<void> {
  const BooksRoute({List<PageRouteInfo>? children})
      : super(
          BooksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BooksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DownloadScreen]
class DownloadRoute extends PageRouteInfo<DownloadRouteArgs> {
  DownloadRoute({
    Key? key,
    required BookDetail book,
    List<PageRouteInfo>? children,
  }) : super(
          DownloadRoute.name,
          args: DownloadRouteArgs(
            key: key,
            book: book,
          ),
          initialChildren: children,
        );

  static const String name = 'DownloadRoute';

  static const PageInfo<DownloadRouteArgs> page =
      PageInfo<DownloadRouteArgs>(name);
}

class DownloadRouteArgs {
  const DownloadRouteArgs({
    this.key,
    required this.book,
  });

  final Key? key;

  final BookDetail book;

  @override
  String toString() {
    return 'DownloadRouteArgs{key: $key, book: $book}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyBooksScreen]
class MyBooksRoute extends PageRouteInfo<void> {
  const MyBooksRoute({List<PageRouteInfo>? children})
      : super(
          MyBooksRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyBooksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuotesScreen]
class QuotesRoute extends PageRouteInfo<void> {
  const QuotesRoute({List<PageRouteInfo>? children})
      : super(
          QuotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuotesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReadBookScreen]
class ReadBookRoute extends PageRouteInfo<ReadBookRouteArgs> {
  ReadBookRoute({
    Key? key,
    required DownloadedBook book,
    List<PageRouteInfo>? children,
  }) : super(
          ReadBookRoute.name,
          args: ReadBookRouteArgs(
            key: key,
            book: book,
          ),
          initialChildren: children,
        );

  static const String name = 'ReadBookRoute';

  static const PageInfo<ReadBookRouteArgs> page =
      PageInfo<ReadBookRouteArgs>(name);
}

class ReadBookRouteArgs {
  const ReadBookRouteArgs({
    this.key,
    required this.book,
  });

  final Key? key;

  final DownloadedBook book;

  @override
  String toString() {
    return 'ReadBookRouteArgs{key: $key, book: $book}';
  }
}
