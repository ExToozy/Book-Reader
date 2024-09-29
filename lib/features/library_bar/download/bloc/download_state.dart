part of 'download_bloc.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState.initial() = _Initial;
  const factory DownloadState.downloading() = _Downloading;
  const factory DownloadState.downloaded() = _Downloaded;
  const factory DownloadState.failure({required Object error}) = _Failure;
}
