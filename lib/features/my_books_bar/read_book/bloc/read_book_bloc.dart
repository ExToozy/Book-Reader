import 'package:book_reader/data/my_books/repositories/my_books_repository.dart';
import 'package:book_reader/data/quotes/repositories/quote_repository.dart';
import 'package:book_reader/domain/models/downloaded_book.dart';
import 'package:book_reader/domain/models/quote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'read_book_bloc.freezed.dart';
part 'read_book_event.dart';
part 'read_book_state.dart';

class ReadBookBloc extends Bloc<ReadBookEvent, ReadBookState> {
  ReadBookBloc(this._myBookRepository, this._quotesRepository)
      : super(const _Initial()) {
    on<ReadBookEvent>((event, emit) async {
      await event.map(
          updateBookCfi: (event) => _onUpdateBookCfi(event, emit),
          addQuote: (event) => _onAddQuote(event, emit));
    });
  }

  final MyBookRepository _myBookRepository;
  final QuoteRepository _quotesRepository;

  Future<void> _onUpdateBookCfi(
    _UpdateBookCfi event,
    Emitter<ReadBookState> emit,
  ) async {
    try {
      _myBookRepository.updateBookCfi(event.book, event.cfi);
    } catch (e) {
      emit(ReadBookState.failure(error: e));
    }
  }

  Future<void> _onAddQuote(
    _AddQuote event,
    Emitter<ReadBookState> emit,
  ) async {
    try {
      emit(const ReadBookState.initial());
      _quotesRepository.addQuote(
        quote: Quote(
          event.quote,
          event.book.author,
          event.book.name,
        ),
      );
      emit(const ReadBookState.successfully());
    } catch (e) {
      emit(ReadBookState.failure(error: e));
    }
  }
}
