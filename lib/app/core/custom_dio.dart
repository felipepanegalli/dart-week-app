import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio(_options);
  }

  CustomDio.withAuthentication() {
    _dio = Dio(_options);
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  BaseOptions _options = BaseOptions(
    // Se ios usa o localhost se android pega o IP da máquina
    baseUrl:
        Platform.isIOS ? 'http://localhost:8000/' : 'http://10.0.0.111:8000/',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  _onRequest(RequestOptions options) {
    var token = '';
    options.headers['Authorization'] = token;
  }

  _onResponse(Response e) {
    print('################# Response LOG #################');
    print(e.data);
    print('#########|| Response LOG ||########');
  }

  _onError(DioError e) {
    if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
      // Fazer logoutr do usuário
      Get.offAllNamed('/');
    }
    return e;
  }
}
