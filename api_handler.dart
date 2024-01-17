// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'components/alertcontroller.dart';
import 'components/progress_loader.dart';
import 'constants.dart';
import 'screens/login.dart';
import 'util/utils.dart';

// ignore: constant_identifier_names
const BASE_URL = "";

// ignore: constant_identifier_names
const BASE_IMAGE_URL = "";

class APIS {
  static const login = "${BASE_URL}login";
}

Future<dynamic> postRequestApi(BuildContext context, String api, Map data,
    [bool? isShowLoader = true]) async {
  //encode Map to JSON
  bool isConnected = await checkInternetConnectivity();
  if (isConnected) {
    var body = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint(api);
    debugPrint(body);
    var token = prefs.getString(Constants.authToken) ?? '';
    if (isShowLoader == true) {
      showLoader(context);
    }
    debugPrint(token);
    var response = await http.post(Uri.parse(api),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    if (isShowLoader == true) {
      hideLoader(context);
    }
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      if ((responseJson["code"] ?? 0) == 200) {
        return responseJson;
      } else if ((responseJson["code"] ?? 0) == 500) {
        final errorResponse = ErrorResponse.fromJson(responseJson);
        handleValidationErrors(
            context, errorResponse.errors, errorResponse.message);
      } else {
        showDialog(
            context: context,
            builder: (_) => AlertController(
                  title: Constants.alert,
                  message:
                      responseJson["message"] ?? Constants.somethingWentWrong,
                ));
      }
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.remove(Constants.isLogin);
      await prefs.remove(Constants.authToken);

      replace(context, const Login());
    } else {
      showDialog(
          context: context,
          builder: (_) => const AlertController(
                title: Constants.alert,
                message: Constants.somethingWentWrong,
              ));
    }
  } else {
    snack(context, 'No Internet Connection');
  }
}

Future<dynamic> getRequestApi(BuildContext context, String api) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isConnected = await checkInternetConnectivity();
  if (isConnected) {
    var token = prefs.getString(Constants.authToken) ?? '';
    debugPrint(api);
    debugPrint(token);
    showLoader(context);
    var response = await http.get(
      Uri.parse(api),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    hideLoader(context);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      if ((responseJson["code"] ?? 0) == 200) {
        return responseJson;
      } else {
        showDialog(
            context: context,
            builder: (_) => AlertController(
                  title: Constants.alert,
                  message:
                      responseJson["message"] ?? Constants.somethingWentWrong,
                ));
      }
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.remove(Constants.isLogin);
      await prefs.remove(Constants.authToken);

      replace(context, const Login());
    } else {
      showDialog(
          context: context,
          builder: (_) => const AlertController(
                title: Constants.alert,
                message: Constants.somethingWentWrong,
              ));
    }
  } else {
    snack(context, 'No Internet Connection');
  }
}

Future<dynamic> uploadFileRequestApi(
    BuildContext context, String api, File? file, Map data,
    [bool? isShowLoader = true, String? fileName = 'files']) async {
  //encode Map to JSON
  bool isConnected = await checkInternetConnectivity();
  if (isConnected) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint(api);

    var token = prefs.getString(Constants.authToken) ?? '';
    if (isShowLoader == true) {
      showLoader(context);
    }
    var uploadEndpoint = Uri.parse(api);

    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      uploadEndpoint,
    );

    request.headers['Content-Type'] = 'application/json';
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';

    // Attach the file to the request
    if (file != null) {
      request.files
          .add(await http.MultipartFile.fromPath(fileName!, file.path));
    }

    // You can also add additional data to the request if needed

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    print(token);
    print(request.fields);
    print(request.files);
    // Send the request
    var response = await request.send();

    if (isShowLoader == true) {
      hideLoader(context);
    }
    if (response.statusCode == 200) {
      String responseBody = await utf8.decodeStream(response.stream);

      // Parse the JSON string
      Map<String, dynamic> responseJson = jsonDecode(responseBody);
      print(responseJson);
      if ((responseJson["code"] ?? 0) == 200) {
        return responseJson;
      } else if ((responseJson["code"] ?? 0) == 500) {
        final errorResponse = ErrorResponse.fromJson(responseJson);
        handleValidationErrors(
            context, errorResponse.errors, errorResponse.message);
      } else {
        showDialog(
            context: context,
            builder: (_) => AlertController(
                  title: Constants.alert,
                  message:
                      responseJson["message"] ?? Constants.somethingWentWrong,
                ));
      }
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.remove(Constants.isLogin);
      await prefs.remove(Constants.authToken);

      replace(context, const Login());
    } else {
      showDialog(
          context: context,
          builder: (_) => const AlertController(
                title: Constants.alert,
                message: Constants.somethingWentWrong,
              ));
    }
  } else {
    snack(context, 'No Internet Connection');
  }
}

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

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult != ConnectivityResult.none;
}

class ErrorResponse {
  final int code;
  final String? message;
  final Map<String, dynamic>? errors;

  ErrorResponse({
    required this.code,
    this.errors,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['code'] ?? 0,
      errors: json['errors'],
      message: json['message'] ?? "",
    );
  }
}

void handleValidationErrors(
    BuildContext context, Map<String, dynamic>? errors, String? message) {
  if (errors != null) {
    bool shouldBreak = false;
    errors.forEach((field, messages) {
      if (!shouldBreak) {
        if (messages is List && messages.isNotEmpty) {
          print('Validation error for $field: ${messages.first}');
          snack(context, messages.first);
          shouldBreak = true;
          // You can handle the error message as needed (e.g., show a toast, update UI)
        }
      }
    });
  } else if (message != null) {
    if (message != 'Already Ended!') {
      snack(context, message);
    }
  }
}

class BaseMessageResponse {
  final int code;
  final String? message;

  BaseMessageResponse({
    required this.code,
    this.message,
  });

  factory BaseMessageResponse.fromJson(Map<String, dynamic> json) {
    return BaseMessageResponse(
      code: json['code'] ?? 0,
      message: json['message'] ?? "",
    );
  }
}

Future<File> fileFromImageUrl(String imgUrl) async {
  final response = await http.get(Uri.parse('$BASE_IMAGE_URL$imgUrl'));

  final documentDirectory = await getApplicationDocumentsDirectory();
  String fileName = imgUrl.split('/').last;
  final file = File('${documentDirectory.path}$fileName');

  file.writeAsBytesSync(response.bodyBytes);

  return file;
}
