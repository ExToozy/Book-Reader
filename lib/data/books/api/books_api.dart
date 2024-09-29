import 'dart:developer';

import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/domain/models/book_detail.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as html;
import 'package:http/http.dart';
import 'package:requests/requests.dart';

class BooksApi {
  Future<List<Book>> getBooks(int page, String? query, String? genre) async {
    var elements = await _getBookElements(page, query, genre);
    final booksData = _getBooksFromHtmlElements(elements);
    return booksData;
  }

  Future<BookDetail> getBookDetail(Book book) async {
    var resp = await Requests.get(book.selfLink!);
    var bookHtml = html.parse(resp.body);
    return BookDetail(
      name: book.name,
      author: book.author,
      imageLink: book.imageLink,
      readersCount: _getBookReadersCount(bookHtml),
      paragraphs: _getBookParagraphs(bookHtml),
      publishingYear: _getBookYear(bookHtml),
      rating: _getBookRating(bookHtml),
      downloadLink: _getDownloadLink(bookHtml),
    );
  }

  int _getBookReadersCount(Document bookHtml) {
    try {
      return int.parse(bookHtml
          .querySelector(
              'body > div.container > div.wrap_cols.relative.top-info > div.left_clmn > div.book_info > div.users_count > span.num_is-reading > span')!
          .innerHtml);
    } catch (e) {
      return 0;
    }
  }

  List<String> _getBookParagraphs(Document bookHtml) {
    var paragraphs = bookHtml
        .querySelectorAll(
            'body > div.container > div.wrap_cols > div.left_clmn.flex-column > div.wrap_description.description > p')
        .map((e) => e.innerHtml)
        .toList();

    return paragraphs.getRange(0, paragraphs.length - 1).toList();
  }

  double _getBookRating(Document bookHtml) {
    double rating = double.parse(bookHtml
        .querySelector(
            'body > div.container > div.wrap_cols.relative.top-info > div.left_clmn > div.book_info > div.book-rating.wrap_rate_block > div.book-rating__num')!
        .innerHtml);
    return rating;
  }

  int _getBookYear(Document bookHtml) {
    try {
      return int.parse(bookHtml
          .querySelectorAll(
              'body > div.container > div.wrap_cols.relative.top-info > div.left_clmn > div.book_info > div.book_category > div')
          .last
          .innerHtml
          .split(" ")[2]);
    } catch (e) {
      return DateTime.now().year;
    }
  }

  Future<List<Element>> _getBookElements(
      int page, String? query, String? genre) async {
    late Response resp;
    if (query?.isNotEmpty ?? false) {
      resp = await Requests.get('https://avidreaders.ru/s/$query/$page');
    } else if (genre?.isNotEmpty ?? false) {
      resp = await Requests.get('https://avidreaders.ru/genre/$genre/$page');
    } else {
      resp = await Requests.get('https://avidreaders.ru/books/$page');
    }

    var document = html.parse(resp.body);
    var elements = document.querySelectorAll(
        "body > div.container.books > div.clear.books_list.with-short-info > div");
    return elements;
  }

  List<Book> _getBooksFromHtmlElements(List<Element> bookElements) {
    List<Book> books = [];
    for (var bookElement in bookElements) {
      try {
        if (bookElement.querySelector('div.book > div.full_version_flag') ==
            null) {
          continue;
        }
        final bookData = Book(
          name:
              bookElement.querySelector('div.book > img')!.attributes['title']!,
          imageLink: bookElement
              .querySelector('div.book > img')!
              .attributes['data-src']!,
          selfLink: bookElement
              .querySelector('div.book > div.hover_info > a')!
              .attributes['href']!,
          author:
              bookElement.querySelector('div.card_info > a.genre')!.innerHtml,
        );
        books.add(bookData);
      } catch (e) {
        log(e.toString());
      }
    }
    return books;
  }

  String _getDownloadLink(Document bookHtml) {
    var booksData = bookHtml
        .querySelectorAll(
            'body > div.container > div.wrap_cols.relative.top-info > div.right_clmn > div.download_block > div')[1]
        .querySelectorAll('div')
        .map(
      (e) {
        if (e.querySelector('strong')!.innerHtml == 'epub' ||
            e.querySelector('strong')!.innerHtml == 'pdf') {
          return e.querySelector('a')!.attributes['href'];
        }
      },
    );
    if (booksData.any((element) => element != null)) {
      for (var element in booksData) {
        if (element != null) {
          if (element.endsWith('epub')) {
            return element;
          }
        }
      }
      for (var element in booksData) {
        if (element != null) {
          if (element.endsWith('pdf')) {
            return element;
          }
        }
      }
    }
    return '';
  }
}
