import 'package:book_reader/domain/models/book.dart';
import 'package:realm/realm.dart';

part 'downloaded_book.g.dart';

@RealmModel()
class _DownloadedBook {
  @PrimaryKey()
  late String id;
  late String name;
  late String imageLink;
  late String author;
  late String storageLink;
  late String position;

  Book toBook() => Book(
        name: name,
        author: author,
        imageLink: imageLink,
        selfLink: storageLink,
      );
}
