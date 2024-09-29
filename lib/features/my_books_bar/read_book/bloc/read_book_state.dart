part of 'read_book_bloc.dart';

@freezed
class ReadBookState with _$ReadBookState {
  const factory ReadBookState.initial() = _Initial;
  const factory ReadBookState.failure({required Object error}) = _Failure;
  const factory ReadBookState.successfully() = _Successfully;
}
