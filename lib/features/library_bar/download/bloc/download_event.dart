part of 'download_bloc.dart';

@freezed
class DownloadEvent with _$DownloadEvent {
  const factory DownloadEvent.started() = _Started;
  const factory DownloadEvent.download({
    required WebUri downloadUrl,
    required BookDetail book,
    String? filename,
  }) = _Download;
}
