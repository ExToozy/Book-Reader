part of 'book_details_bloc.dart';

@freezed
class BookDetailsEvent with _$BookDetailsEvent {
  const factory BookDetailsEvent.loadBook({required Book book}) = _LoadBook;
}
