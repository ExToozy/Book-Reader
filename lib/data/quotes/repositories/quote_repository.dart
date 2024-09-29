import 'package:book_reader/domain/models/quote.dart';
import 'package:book_reader/domain/repositories/i_quote_repository.dart';
import 'package:realm/realm.dart';

class QuoteRepository implements IQuoteRepository {
  QuoteRepository({required this.realm});
  final Realm realm;

  @override
  Future<void> addQuote({required Quote quote}) async {
    return realm.write(() => realm.add(quote));
  }

  @override
  Future<void> deleteQuote({required Quote quote}) async {
    realm.write(() => realm.delete(quote));
  }

  @override
  Future<void> deleteQuotes({required List<Quote> quotes}) async {
    realm.write(() => realm.deleteMany(quotes));
  }

  @override
  Future<List<Quote>> getQuotes({String? query}) async {
    List<Quote> books = realm.all<Quote>().toList();
    List<Quote> fondedQuotes = [];
    if (query != null) {
      for (var element in books) {
        if (element.quote.toLowerCase().contains(query)) {
          fondedQuotes.add(element);
        }
      }
    }
    if (query?.isNotEmpty ?? false) {
      return fondedQuotes;
    }
    return books;
  }
}
