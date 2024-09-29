import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/domain/models/book_detail.dart';
import 'package:book_reader/domain/repositories/i_book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_details_bloc.freezed.dart';
part 'book_details_event.dart';
part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  BookDetailsBloc(this._repository) : super(const _Initial()) {
    on<BookDetailsEvent>((event, emit) async {
      await event.map(
        loadBook: (event) => _onLoadEvent(event, emit),
      );
    });
  }

  final IBookRepository _repository;

  Future<void> _onLoadEvent(
    _LoadBook event,
    Emitter<BookDetailsState> emit,
  ) async {
    try {
      emit(const BookDetailsState.loading());
      BookDetail book = await _repository.getBookDetail(book: event.book);
      emit(BookDetailsState.loaded(book: book));
    } catch (e) {
      emit(BookDetailsState.failure(error: e));
    }
  }
}
