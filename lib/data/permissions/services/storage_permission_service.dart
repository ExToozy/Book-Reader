import 'package:book_reader/data/permissions/models/storage_permission_status.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class StoragePermissionsService {
  Future<StoragePermissionStatus> checkDownloadPermissions() async {
    late Permission permission;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt < 33) {
      permission = Permission.storage;
    } else {
      permission = Permission.manageExternalStorage;
    }
    final permissionStatus = await permission.status;
    if (permissionStatus == PermissionStatus.permanentlyDenied ||
        permissionStatus == PermissionStatus.restricted) {
      return StoragePermissionStatus.denied;
    } else if (permissionStatus == PermissionStatus.denied) {
      final newStatus = await permission.request();
      if (newStatus == PermissionStatus.permanentlyDenied ||
          newStatus == PermissionStatus.restricted) {
        return StoragePermissionStatus.denied;
      } else if (newStatus == PermissionStatus.denied) {
        return StoragePermissionStatus.notGranted;
      } else {
        return StoragePermissionStatus.granted;
      }
    } else {
      return StoragePermissionStatus.granted;
    }
  }
}
