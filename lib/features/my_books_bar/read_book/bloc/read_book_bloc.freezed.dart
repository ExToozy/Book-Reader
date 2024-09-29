// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'read_book_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReadBookEvent {
  DownloadedBook get book => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cfi, DownloadedBook book) updateBookCfi,
    required TResult Function(DownloadedBook book, String quote) addQuote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cfi, DownloadedBook book)? updateBookCfi,
    TResult? Function(DownloadedBook book, String quote)? addQuote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cfi, DownloadedBook book)? updateBookCfi,
    TResult Function(DownloadedBook book, String quote)? addQuote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateBookCfi value) updateBookCfi,
    required TResult Function(_AddQuote value) addQuote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateBookCfi value)? updateBookCfi,
    TResult? Function(_AddQuote value)? addQuote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateBookCfi value)? updateBookCfi,
    TResult Function(_AddQuote value)? addQuote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadBookEventCopyWith<ReadBookEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadBookEventCopyWith<$Res> {
  factory $ReadBookEventCopyWith(
          ReadBookEvent value, $Res Function(ReadBookEvent) then) =
      _$ReadBookEventCopyWithImpl<$Res, ReadBookEvent>;
  @useResult
  $Res call({DownloadedBook book});
}

/// @nodoc
class _$ReadBookEventCopyWithImpl<$Res, $Val extends ReadBookEvent>
    implements $ReadBookEventCopyWith<$Res> {
  _$ReadBookEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_value.copyWith(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as DownloadedBook,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateBookCfiImplCopyWith<$Res>
    implements $ReadBookEventCopyWith<$Res> {
  factory _$$UpdateBookCfiImplCopyWith(
          _$UpdateBookCfiImpl value, $Res Function(_$UpdateBookCfiImpl) then) =
      __$$UpdateBookCfiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cfi, DownloadedBook book});
}

/// @nodoc
class __$$UpdateBookCfiImplCopyWithImpl<$Res>
    extends _$ReadBookEventCopyWithImpl<$Res, _$UpdateBookCfiImpl>
    implements _$$UpdateBookCfiImplCopyWith<$Res> {
  __$$UpdateBookCfiImplCopyWithImpl(
      _$UpdateBookCfiImpl _value, $Res Function(_$UpdateBookCfiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cfi = null,
    Object? book = null,
  }) {
    return _then(_$UpdateBookCfiImpl(
      cfi: null == cfi
          ? _value.cfi
          : cfi // ignore: cast_nullable_to_non_nullable
              as String,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as DownloadedBook,
    ));
  }
}

/// @nodoc

class _$UpdateBookCfiImpl implements _UpdateBookCfi {
  const _$UpdateBookCfiImpl({required this.cfi, required this.book});

  @override
  final String cfi;
  @override
  final DownloadedBook book;

  @override
  String toString() {
    return 'ReadBookEvent.updateBookCfi(cfi: $cfi, book: $book)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBookCfiImpl &&
            (identical(other.cfi, cfi) || other.cfi == cfi) &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cfi, book);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBookCfiImplCopyWith<_$UpdateBookCfiImpl> get copyWith =>
      __$$UpdateBookCfiImplCopyWithImpl<_$UpdateBookCfiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cfi, DownloadedBook book) updateBookCfi,
    required TResult Function(DownloadedBook book, String quote) addQuote,
  }) {
    return updateBookCfi(cfi, book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cfi, DownloadedBook book)? updateBookCfi,
    TResult? Function(DownloadedBook book, String quote)? addQuote,
  }) {
    return updateBookCfi?.call(cfi, book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cfi, DownloadedBook book)? updateBookCfi,
    TResult Function(DownloadedBook book, String quote)? addQuote,
    required TResult orElse(),
  }) {
    if (updateBookCfi != null) {
      return updateBookCfi(cfi, book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateBookCfi value) updateBookCfi,
    required TResult Function(_AddQuote value) addQuote,
  }) {
    return updateBookCfi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateBookCfi value)? updateBookCfi,
    TResult? Function(_AddQuote value)? addQuote,
  }) {
    return updateBookCfi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateBookCfi value)? updateBookCfi,
    TResult Function(_AddQuote value)? addQuote,
    required TResult orElse(),
  }) {
    if (updateBookCfi != null) {
      return updateBookCfi(this);
    }
    return orElse();
  }
}

abstract class _UpdateBookCfi implements ReadBookEvent {
  const factory _UpdateBookCfi(
      {required final String cfi,
      required final DownloadedBook book}) = _$UpdateBookCfiImpl;

  String get cfi;
  @override
  DownloadedBook get book;
  @override
  @JsonKey(ignore: true)
  _$$UpdateBookCfiImplCopyWith<_$UpdateBookCfiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddQuoteImplCopyWith<$Res>
    implements $ReadBookEventCopyWith<$Res> {
  factory _$$AddQuoteImplCopyWith(
          _$AddQuoteImpl value, $Res Function(_$AddQuoteImpl) then) =
      __$$AddQuoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DownloadedBook book, String quote});
}

/// @nodoc
class __$$AddQuoteImplCopyWithImpl<$Res>
    extends _$ReadBookEventCopyWithImpl<$Res, _$AddQuoteImpl>
    implements _$$AddQuoteImplCopyWith<$Res> {
  __$$AddQuoteImplCopyWithImpl(
      _$AddQuoteImpl _value, $Res Function(_$AddQuoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
    Object? quote = null,
  }) {
    return _then(_$AddQuoteImpl(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as DownloadedBook,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddQuoteImpl implements _AddQuote {
  const _$AddQuoteImpl({required this.book, required this.quote});

  @override
  final DownloadedBook book;
  @override
  final String quote;

  @override
  String toString() {
    return 'ReadBookEvent.addQuote(book: $book, quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddQuoteImpl &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.quote, quote) || other.quote == quote));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book, quote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddQuoteImplCopyWith<_$AddQuoteImpl> get copyWith =>
      __$$AddQuoteImplCopyWithImpl<_$AddQuoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cfi, DownloadedBook book) updateBookCfi,
    required TResult Function(DownloadedBook book, String quote) addQuote,
  }) {
    return addQuote(book, quote);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cfi, DownloadedBook book)? updateBookCfi,
    TResult? Function(DownloadedBook book, String quote)? addQuote,
  }) {
    return addQuote?.call(book, quote);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cfi, DownloadedBook book)? updateBookCfi,
    TResult Function(DownloadedBook book, String quote)? addQuote,
    required TResult orElse(),
  }) {
    if (addQuote != null) {
      return addQuote(book, quote);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateBookCfi value) updateBookCfi,
    required TResult Function(_AddQuote value) addQuote,
  }) {
    return addQuote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateBookCfi value)? updateBookCfi,
    TResult? Function(_AddQuote value)? addQuote,
  }) {
    return addQuote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateBookCfi value)? updateBookCfi,
    TResult Function(_AddQuote value)? addQuote,
    required TResult orElse(),
  }) {
    if (addQuote != null) {
      return addQuote(this);
    }
    return orElse();
  }
}

abstract class _AddQuote implements ReadBookEvent {
  const factory _AddQuote(
      {required final DownloadedBook book,
      required final String quote}) = _$AddQuoteImpl;

  @override
  DownloadedBook get book;
  String get quote;
  @override
  @JsonKey(ignore: true)
  _$$AddQuoteImplCopyWith<_$AddQuoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReadBookState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Object error) failure,
    required TResult Function() successfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Object error)? failure,
    TResult? Function()? successfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Object error)? failure,
    TResult Function()? successfully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Successfully value) successfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Successfully value)? successfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_Successfully value)? successfully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadBookStateCopyWith<$Res> {
  factory $ReadBookStateCopyWith(
          ReadBookState value, $Res Function(ReadBookState) then) =
      _$ReadBookStateCopyWithImpl<$Res, ReadBookState>;
}

/// @nodoc
class _$ReadBookStateCopyWithImpl<$Res, $Val extends ReadBookState>
    implements $ReadBookStateCopyWith<$Res> {
  _$ReadBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ReadBookStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ReadBookState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Object error) failure,
    required TResult Function() successfully,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Object error)? failure,
    TResult? Function()? successfully,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Object error)? failure,
    TResult Function()? successfully,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Successfully value) successfully,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Successfully value)? successfully,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_Successfully value)? successfully,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReadBookState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$ReadBookStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureImpl(
      error: null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl({required this.error});

  @override
  final Object error;

  @override
  String toString() {
    return 'ReadBookState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Object error) failure,
    required TResult Function() successfully,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Object error)? failure,
    TResult? Function()? successfully,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Object error)? failure,
    TResult Function()? successfully,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Successfully value) successfully,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Successfully value)? successfully,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_Successfully value)? successfully,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ReadBookState {
  const factory _Failure({required final Object error}) = _$FailureImpl;

  Object get error;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessfullyImplCopyWith<$Res> {
  factory _$$SuccessfullyImplCopyWith(
          _$SuccessfullyImpl value, $Res Function(_$SuccessfullyImpl) then) =
      __$$SuccessfullyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessfullyImplCopyWithImpl<$Res>
    extends _$ReadBookStateCopyWithImpl<$Res, _$SuccessfullyImpl>
    implements _$$SuccessfullyImplCopyWith<$Res> {
  __$$SuccessfullyImplCopyWithImpl(
      _$SuccessfullyImpl _value, $Res Function(_$SuccessfullyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessfullyImpl implements _Successfully {
  const _$SuccessfullyImpl();

  @override
  String toString() {
    return 'ReadBookState.successfully()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessfullyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Object error) failure,
    required TResult Function() successfully,
  }) {
    return successfully();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Object error)? failure,
    TResult? Function()? successfully,
  }) {
    return successfully?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Object error)? failure,
    TResult Function()? successfully,
    required TResult orElse(),
  }) {
    if (successfully != null) {
      return successfully();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Successfully value) successfully,
  }) {
    return successfully(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Successfully value)? successfully,
  }) {
    return successfully?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_Successfully value)? successfully,
    required TResult orElse(),
  }) {
    if (successfully != null) {
      return successfully(this);
    }
    return orElse();
  }
}

abstract class _Successfully implements ReadBookState {
  const factory _Successfully() = _$SuccessfullyImpl;
}
