import 'dart:io';

import 'package:flutter/material.dart';
import './progress_loader.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<T?> push<T>(BuildContext context, Widget child) =>
    Navigator.of(context).push<T>(MaterialPageRoute(builder: (_) => child));

void replace(BuildContext context, Widget child) => Navigator.of(context)
    .pushReplacement(MaterialPageRoute(builder: (_) => child));

void pop<T>(BuildContext context, {T? data}) => Navigator.of(context).pop(data);

void popToDashboard(BuildContext context) =>
    Navigator.of(context).popUntil((route) => route.isFirst);

double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

void snack(BuildContext context, String message, {bool info = false}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: info ? Colors.green : Colors.red,
      duration: const Duration(milliseconds: 1500),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            ),
      ),
    ));

void showLoader(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => const ProgressLoader(),
  );
}

void hideLoader(BuildContext context) {
  Navigator.of(context).pop();
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Future<String> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor ?? ""; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.serialNumber; // unique ID on Android
  }
  return "";
}
