import 'package:book_reader/data/quotes/repositories/quote_repository.dart';
import 'package:book_reader/domain/models/quote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_bloc.freezed.dart';
part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  QuotesBloc(this._repository) : super(const _Initial()) {
    on<QuotesEvent>((event, emit) async {
      await event.map(
          load: (event) => _onLoad(event, emit),
          delete: (event) => _onDelete(event, emit),
          search: (event) => _onSearch(event, emit));
    });
  }

  final QuoteRepository _repository;

  Future<void> _onLoad(_Started event, Emitter<QuotesState> emit) async {
    try {
      emit(const QuotesState.loading());
      final quotes = await _repository.getQuotes();
      emit(QuotesState.loaded(quotes: quotes));
    } catch (e) {
      emit(QuotesState.failure(error: e.toString()));
    }
  }

  Future<void> _onDelete(_Delete event, Emitter<QuotesState> emit) async {
    try {
      emit(const QuotesState.loading());
      await _repository.deleteQuote(quote: event.quote);
      final quotes = await _repository.getQuotes();
      emit(QuotesState.loaded(quotes: quotes));
    } catch (e) {
      emit(QuotesState.failure(error: e.toString()));
    }
  }

  Future<void> _onSearch(_Search event, Emitter<QuotesState> emit) async {
    try {
      emit(const QuotesState.loading());
      final quotes = await _repository.getQuotes(query: event.query);
      emit(QuotesState.loaded(quotes: quotes));
    } catch (e) {
      emit(QuotesState.failure(error: e.toString()));
    }
  }
}
