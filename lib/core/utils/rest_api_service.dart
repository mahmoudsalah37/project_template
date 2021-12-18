import 'dart:convert';

import 'package:dio/dio.dart';

import 'custom_exception.dart';

class RestApiImp implements RestApi {
  String _domin = '', _token = '';
  Map<String, dynamic>? _defaultQueryParameters;
  Map<String, dynamic>? _defaultHeaders;
  final _dio = Dio();

  static final instace = RestApiImp();

  RestApiImp() {
    _dio.options.baseUrl = _domin;
    _dio.options.headers = _defaultHeaders;
  }

  @override
  void init(
      {required String domin,
      int version = 1,
      required String token,
      int lang = 1,
      int? zoneid}) {
    _domin = '$domin/api/v$version/';
    _token = token;
    _defaultQueryParameters = {
      'lang': lang,
      'ZoneID': zoneid,
    };
    _defaultHeaders = {
      "requiresToken": true,
      'authorization': 'Bearer $_token',
    };
  }

  @override
  Future<Response> getData(
      {required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic>? headers}) async {
    _dio.options.headers = headers ?? _defaultHeaders;
    try {
      final response = _dio.get(
        path,
        queryParameters: _getQueryParameters(queryParameters),
      );
      return response;
    } on DioError catch (e) {
      throw CustomException(code: null, message: e.message);
    }
  }

  @override
  Future<Response> postData(
      {dynamic data,
      required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic>? headers}) async {
    _dio.options.headers = headers ?? _defaultHeaders;
    try {
      final response = _dio.post(path,
          queryParameters: _getQueryParameters(queryParameters),
          data: jsonEncode(data));
      return response;
    } on DioError catch (e) {
      throw CustomException(code: null, message: e.message);
    }
  }

  @override
  Future<Response> putData(dynamic data,
      {required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic>? headers}) async {
    _dio.options.headers = headers ?? _defaultHeaders;
    try {
      final response = _dio.put(path,
          queryParameters: _getQueryParameters(queryParameters),
          data: jsonEncode(data));
      return response;
    } on DioError catch (e) {
      throw CustomException(code: null, message: e.message);
    }
  }

  @override
  Future<Response> deleteData(
      {required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic>? headers}) async {
    _dio.options.headers = headers ?? _defaultHeaders;
    try {
      final response = _dio.delete(
        path,
        queryParameters: _getQueryParameters(queryParameters),
      );
      return response;
    } on DioError catch (e) {
      throw CustomException(code: null, message: e.message);
    }
  }

  Map<String, dynamic> _getQueryParameters(
      Map<String, dynamic> queryParameters) {
    return Map<String, dynamic>.from(_defaultQueryParameters ?? {})
      ..addAll(queryParameters);
  }

  @override
  void clear() {
    _dio.clear();
  }

  @override
  void close() {
    _dio.close();
  }
}

abstract class RestApi {
  void init(
      {required String domin,
      int version = 1,
      required String token,
      int lang = 1,
      int? zoneid});
  Future<Response> getData(
      {required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic>? headers});
  Future<Response> postData(
      {dynamic data,
      required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic>? headers});
  Future<Response> putData(dynamic data,
      {required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic>? headers});
  Future<Response> deleteData(
      {required String path,
      Map<String, dynamic> queryParameters = const {},
      Map<String, dynamic>? headers});
  void clear();
  void close();
}
