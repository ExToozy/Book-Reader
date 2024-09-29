import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/domain/repositories/i_book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'books_bloc.freezed.dart';
part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc(this._repository) : super(const _Initial()) {
    on<BooksEvent>((event, emit) async {
      await event.map(
        started: (event) => _onStartedEvent(event, emit),
        load: (event) => _onLoadEvent(event, emit),
        search: (event) => _onSearchEvent(event, emit),
        searchGenre: (event) => _onSearchGenreEvent(event, emit),
      );
    });
  }

  final IBookRepository _repository;

  _onStartedEvent(_Started event, Emitter<BooksState> emit) async {
    try {
      emit(BooksState.loading(
        genre: state.genre,
        query: state.query,
        page: 0,
        books: state.books,
      ));
      List<Book> books = await _repository.getBooks(page: 0);

      emit(BooksState.loaded(
        genre: state.genre,
        query: state.query,
        page: 0,
        books: books,
      ));
    } catch (e) {
      emit(BooksState.failure(
        genre: state.genre,
        page: 0,
        error: e,
        query: state.query,
      ));
    }
  }

  Future<void> _onLoadEvent(
    _Load event,
    Emitter<BooksState> emit,
  ) async {
    try {
      int currentPage = state.page + 1;
      if (currentPage == 1) {
        currentPage = 2;
      }
      emit(BooksState.loading(
        genre: state.genre,
        query: state.query,
        page: currentPage,
        books: state.books,
      ));
      List<Book> books = await _repository.getBooks(
        page: currentPage,
        query: state.query,
        genre: state.genre,
      );
      List<Book> booksCopy = List<Book>.from(event.books);
      booksCopy.addAll(books);

      emit(BooksState.loaded(
        genre: state.genre,
        query: state.query,
        page: currentPage,
        books: booksCopy,
      ));
    } catch (e) {
      emit(BooksState.failure(
        genre: state.genre,
        page: state.page,
        error: e,
        query: state.query,
      ));
    }
  }

  Future<void> _onSearchEvent(
    _Search event,
    Emitter<BooksState> emit,
  ) async {
    emit(BooksState.loading(
      genre: '',
      query: event.query,
      page: 0,
      books: state.books,
    ));

    List<Book> books = await _repository.getBooks(page: 0, query: event.query);

    emit(BooksState.loaded(
      genre: '',
      query: event.query,
      page: 0,
      books: books,
    ));
  }

  _onSearchGenreEvent(_SearchGenre event, Emitter<BooksState> emit) async {
    emit(BooksState.loading(
      genre: event.genre,
      query: '',
      page: 0,
      books: state.books,
    ));

    List<Book> books = await _repository.getBooks(page: 0, genre: event.genre);

    emit(BooksState.loaded(
      genre: event.genre,
      query: '',
      page: 0,
      books: books,
    ));
  }
}
