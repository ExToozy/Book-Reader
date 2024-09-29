part of 'book_details_bloc.dart';

@freezed
class BookDetailsState with _$BookDetailsState {
  const BookDetailsState._();
  const factory BookDetailsState.initial() = _Initial;
  const factory BookDetailsState.loading() = _Loading;
  const factory BookDetailsState.loaded({required BookDetail book}) = _Loaded;
  const factory BookDetailsState.failure({required Object error}) = _Failure;

  BookDetail? get bookDetail => when(
        initial: () => null,
        loading: () => null,
        loaded: (book) => book,
        failure: (error) => null,
      );
}
