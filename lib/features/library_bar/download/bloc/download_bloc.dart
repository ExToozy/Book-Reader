import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:book_reader/data/download/services/download_service.dart';
import 'package:book_reader/domain/models/book_detail.dart';
import 'package:book_reader/domain/models/downloaded_book.dart';
import 'package:book_reader/domain/repositories/i_my_book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realm/realm.dart';

part 'download_bloc.freezed.dart';
part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc(this.downloadService, this._myBookRepository)
      : super(const _Initial()) {
    on<DownloadEvent>((event, emit) async {
      await event.map(
        download: (event) => _onDownloadEvent(event, emit),
        started: (event) => _onStarted(event, emit),
      );
    });
  }

  final DownloadService downloadService;
  final ReceivePort _port = ReceivePort();
  final IMyBooksRepository _myBookRepository;

  _onStarted(_Started event, Emitter<DownloadState> emit) {
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    FlutterDownloader.registerCallback(downloadCallback);
  }

  Future<void> _onDownloadEvent(
    _Download event,
    Emitter<DownloadState> emit,
  ) async {
    try {
      emit(const DownloadState.downloading());
      final status = await downloadService.downloadFile(
          url: event.downloadUrl.toString(), filename: event.filename);
      if (status.$1) {
        _myBookRepository.addBook(
          DownloadedBook(
            Uuid.v4().toString(),
            event.book.name,
            '${status.$2}.png',
            event.book.author,
            event.filename.toString().endsWith('epub')
                ? '${status.$2}.epub'
                : '${status.$2}.pdf',
            '',
          ),
        );
        emit(const DownloadState.downloaded());
      } else {
        log("Во время загрузки произошла ошибка");
        emit(const DownloadState.failure(
            error: "Во время загрузки произошла ошибка"));
      }
    } catch (e) {
      log(e.toString());
      emit(DownloadState.failure(error: e));
    }
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
    String id,
    int status,
    int progress,
  ) {
    IsolateNameServer.lookupPortByName('downloader_send_port')
        ?.send([id, status, progress]);
  }
}
