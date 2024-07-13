import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:mvvm_architecture/data/network/NetworkApiServices.dart';

import 'package:mvvm_architecture/resources/app_url.dart';

class AuthRepository {
  // AuthRepository({required BaseApiServices apiService }) : _apiServices = apiService;
  // final BaseApiServices _apiServices ;
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(
            "...............error when try to call networkApiServices()....$e");
      }
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
