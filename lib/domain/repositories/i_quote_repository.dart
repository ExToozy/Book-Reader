import 'package:book_reader/domain/models/quote.dart';

abstract interface class IQuoteRepository {
  Future<List<Quote>> getQuotes({String? query});
  Future<void> addQuote({required Quote quote});
  Future<void> deleteQuote({required Quote quote});
  Future<void> deleteQuotes({required List<Quote> quotes});
}
