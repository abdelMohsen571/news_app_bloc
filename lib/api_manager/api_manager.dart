import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiManager {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://newsapi.org/", receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String path, required Map<String, dynamic> query}) async {
    return await dio.get(path, queryParameters: query);
  }
}
