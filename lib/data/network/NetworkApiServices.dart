import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mvvm_architecture/data/app_exception.dart';
import 'package:mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  Map<String, String> header = {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
    'Access-Control-Allow-Headers': 'Content-Type',
    "content-type": "application/json",
  };
  Duration timeOut =const Duration(seconds: 30);

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(timeOut);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(" No internet connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response =
          await post(headers: header, Uri.parse(url), body: jsonEncode(data))
              .timeout(timeOut);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(" No internet connection");
    }
    ///// editing itself 13.07.24
    catch (e) {
      debugPrint(e.toString());
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("printing from networkapiservices $responseJson");
        return responseJson;

      case 400:
        return BadRequestException(response.body.toLowerCase());
      case 404:
        return UnAuthorisedException(response.body.toLowerCase());
      default:
        // ignore: prefer_interpolation_to_compose_strings
        return FetchDataException(
            "error accured while communicating with serverwith status code ${response.statusCode}");
    }
  }
}
