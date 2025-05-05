import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

bool get isAndroid => Platform.isAndroid;

Future<bool> isAndroid13OrAbove() async {
  if (!isAndroid) {
    return false;
  }

  final deviceInfo = DeviceInfoPlugin();
  final androidInfo = await deviceInfo.androidInfo;
  return androidInfo.version.sdkInt >= 33;
}
