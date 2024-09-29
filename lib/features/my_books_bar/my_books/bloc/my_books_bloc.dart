import 'dart:io';

import 'package:book_reader/data/permissions/models/storage_permission_status.dart';
import 'package:book_reader/data/permissions/services/storage_permission_service.dart';
import 'package:book_reader/domain/models/downloaded_book.dart';
import 'package:book_reader/domain/repositories/i_my_book_repository.dart';
import 'package:epub_view/epub_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart';
import 'package:uuid/uuid.dart';

part 'my_books_bloc.freezed.dart';
part 'my_books_event.dart';
part 'my_books_state.dart';

class MyBooksBloc extends Bloc<MyBooksEvent, MyBooksState> {
  MyBooksBloc(this._repository) : super(const _Initial()) {
    on<MyBooksEvent>((event, emit) async {
      await event.map(
        started: (event) => _onStarted(event, emit),
        newBookAdded: (event) => _onNewBookAdded(event, emit),
        search: (event) => _onSearch(event, emit),
        add: (event) => _onAdd(event, emit),
        delete: (event) => _onDelete(event, emit),
      );
    });
  }

  final IMyBooksRepository _repository;

  Future<void> _onStarted(
    _Started event,
    Emitter<MyBooksState> emit,
  ) async {
    try {
      emit(const MyBooksState.loading());
      final books = await _repository.getBooks();
      emit(MyBooksState.loaded(books: books.reversed.toList()));
    } catch (e) {
      emit(MyBooksState.failure(error: e));
    }
  }

  Future<void> _onNewBookAdded(
    _NewBookAdded event,
    Emitter<MyBooksState> emit,
  ) async {
    try {
      emit(const MyBooksState.loading());
      final books = await _repository.getBooks();
      emit(MyBooksState.loaded(books: books.reversed.toList()));
    } catch (e) {
      emit(MyBooksState.failure(error: e));
    }
  }

  Future<void> _onSearch(
    _Search event,
    Emitter<MyBooksState> emit,
  ) async {
    try {
      emit(const MyBooksState.loading());
      final books = await _repository.getBooks(query: event.query);
      emit(MyBooksState.loaded(books: books.reversed.toList()));
    } catch (e) {
      emit(MyBooksState.failure(error: e));
    }
  }

  Future<void> _onAdd(_Add event, Emitter<MyBooksState> emit) async {
    try {
      emit(const MyBooksState.loading());
      final permissionStatus =
          await StoragePermissionsService().checkDownloadPermissions();
      if (permissionStatus == StoragePermissionStatus.denied) {
        throw Exception('Permissions denied');
      }
      if (permissionStatus == StoragePermissionStatus.notGranted) {
        throw Exception('Permissions not granted');
      }
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        if (result.files.single.path!.endsWith('.epub')) {
          await _addEpubBook(result);
        } else if (result.files.single.path!.endsWith('.pdf')) {
          await _addPdfBook(result);
        }
      }
      final books = await _repository.getBooks();
      emit(MyBooksState.loaded(books: books.reversed.toList()));
    } catch (e) {
      emit(MyBooksState.failure(error: e));
    }
  }

  Future<void> _addEpubBook(FilePickerResult result) async {
    File file = File(result.files.single.path!);
    List<int> bytes = await file.readAsBytes();
    var epubBook = await EpubReader.readBook(bytes);
    String? imagePath;
    if (epubBook.CoverImage != null) {
      imagePath = file.path.replaceAll(RegExp(r'\.epub$'), '.png');
      await File(imagePath).writeAsBytes(encodePng(epubBook.CoverImage!));
    }
    final book = DownloadedBook(
      const Uuid().v4().toString(),
      epubBook.Title ?? 'Без имени',
      imagePath ?? '',
      epubBook.Author ?? 'Без автора',
      file.path,
      '',
    );
    _repository.addBook(book);
  }

  Future<void> _addPdfBook(FilePickerResult result) async {
    File file = File(result.files.single.path!);
    final book = DownloadedBook(
      const Uuid().v4().toString(),
      file.uri.pathSegments.last.replaceAll(RegExp(r'\.pdf$'), ''),
      '',
      'Без автора',
      file.path,
      '',
    );
    _repository.addBook(book);
  }

  Future<void> _onDelete(_Delete event, Emitter<MyBooksState> emit) async {
    try {
      emit(const MyBooksState.loading());
      await _repository.deleteBook(event.book);
      final books = await _repository.getBooks();
      emit(MyBooksState.loaded(books: books.reversed.toList()));
    } catch (e) {
      emit(MyBooksState.failure(error: e));
    }
  }
}
