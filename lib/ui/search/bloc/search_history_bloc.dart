import 'dart:developer';

import 'package:book_reader/domain/models/search_history.dart';
import 'package:book_reader/domain/repositories/i_search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'search_history_bloc.freezed.dart';
part 'search_history_event.dart';
part 'search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  SearchHistoryBloc(this.repository) : super(const _Initial()) {
    on<SearchHistoryEvent>((event, emit) async {
      await event.map(
        started: (event) => _onStarted(event, emit),
        add: (event) => _onAdd(event, emit),
        delete: (event) => _onDelete(event, emit),
      );
    });
  }
  final ISearchHistoryRepository repository;
  Future<void> _onStarted(
    _Started event,
    Emitter<SearchHistoryState> emit,
  ) async {
    try {
      emit(const SearchHistoryState.loading());
      final history = await repository.getSearchHistory();
      history.sort((b, a) => a.searchTime.compareTo(b.searchTime));
      emit(SearchHistoryState.loaded(history: history));
    } catch (e) {
      emit(const SearchHistoryState.failure());
    }
  }

  Future<void> _onAdd(
    _Add event,
    Emitter<SearchHistoryState> emit,
  ) async {
    try {
      if (event.query.isEmpty) {
        return;
      }
      await repository.addSearchHistory(
        query: SearchHistory(
          const Uuid().v4(),
          event.query,
          DateTime.now(),
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(const SearchHistoryState.failure());
    }
  }

  Future<void> _onDelete(
    _Delete event,
    Emitter<SearchHistoryState> emit,
  ) async {
    try {
      await repository.deleteSearchHistory(query: event.query);
      final history = await repository.getSearchHistory();
      history.sort((b, a) => a.searchTime.compareTo(b.searchTime));
      emit(SearchHistoryState.loaded(history: history));
    } catch (e) {
      emit(const SearchHistoryState.failure());
    }
  }
}
