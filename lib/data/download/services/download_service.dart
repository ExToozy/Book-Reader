import 'dart:developer';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:book_reader/data/permissions/models/storage_permission_status.dart';
import 'package:book_reader/data/permissions/services/storage_permission_service.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

class DownloadService {
  Future<(bool, String)> downloadFile({
    required String url,
    String? filename,
  }) async {
    final permissionStatus =
        await StoragePermissionsService().checkDownloadPermissions();
    if (permissionStatus == StoragePermissionStatus.denied) {
      throw Exception('Permissions denied');
    }
    if (permissionStatus == StoragePermissionStatus.notGranted) {
      throw Exception('Permissions not granted');
    }

    final taskId = await FlutterDownloader.enqueue(
      url: url,
      showNotification: true,
      savedDir: (await getDownloadsDirectory())!.path,
      fileName: filename,
    );
    bool fileDownloaded = false;
    for (var i = 0; i < 20; i++) {
      final task = await FlutterDownloader.loadTasksWithRawQuery(
          query: "SELECT * FROM task WHERE task_id = '$taskId'");
      if (task != null) {
        if (task[0].status.name == 'canceled' ||
            task[0].status.name == 'failed') {
          fileDownloaded = false;
          break;
        }
        if (task[0].status.name == 'paused' ||
            task[0].status.name == 'running') {
          i--;
        }
        if (task[0].status.name == 'complete') {
          fileDownloaded = true;
          break;
        }
      }
      await Future.delayed(const Duration(milliseconds: 100));
    }
    if (fileDownloaded) {
      final task = await FlutterDownloader.loadTasksWithRawQuery(
          query: "SELECT * FROM task WHERE task_id = '$taskId'");
      if (task![0].filename?.endsWith('zip') ?? false) {
        final inputStream =
            InputFileStream('${task[0].savedDir}/${task[0].filename}');
        final archive = ZipDecoder().decodeBuffer(inputStream);
        for (var file in archive.files) {
          if (file.isFile && file.name.endsWith('pdf')) {
            final outputStream =
                OutputFileStream('${task[0].savedDir}/${file.name}');
            file.writeContent(outputStream);
            outputStream.close();
            return (
              true,
              '${task[0].savedDir}/${file.name.replaceAll(RegExp(r'\.pdf$'), '')}'
            );
          }
        }
      }
      await _downloadImageFromEpub(task[0].savedDir, task[0].filename);
      log('${task[0].savedDir}/${task[0].filename!.replaceAll(RegExp(r'\.epub$'), '')}');
      return (
        true,
        '${task[0].savedDir}/${task[0].filename!.replaceAll(RegExp(r'\.epub$'), '')}'
      );
    }
    return (false, '');
  }

  Future<void> _downloadImageFromEpub(String savedDir, String? filename) async {
    List<int> bytes = await File('$savedDir/$filename').readAsBytes();
    var epubBook = await EpubReader.readBook(bytes);
    if (epubBook.CoverImage != null) {
      String filenameWithoutSuffix =
          filename!.replaceAll(RegExp(r'\.epub$'), '');
      String imagePath = '$savedDir/$filenameWithoutSuffix.png';
      await File(imagePath).writeAsBytes(encodePng(epubBook.CoverImage!));
    }
  }
}
