import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'endpoints.dart';

class DioConfigure {
  // static final UserCredentialsRepository _userCredentialsRepository =
  //     Get.find();

  // contact with real API
  Dio dio = createDio();

  static final endpoints = Get.find<Endpoints>();

  DioConfigure._internal();

  static final _singleton = DioConfigure._internal();

  factory DioConfigure() => _singleton;

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2',
        receiveTimeout: Duration(seconds: 30),
        connectTimeout: Duration(seconds: 10),
        followRedirects: false,
        receiveDataWhenStatusError: true,
        // headers: <String, String>{
        //   'Authorization':
        //       'Bearer ${_userCredentialsRepository.getCredentials().token}',
        //   'Content-Type': 'application/json'
        // },
      ),
    );

    dio.interceptors.addAll({
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    });

    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) async {
    //       final credential = _userCredentialsRepository.getCredentials();
    //       final accessToken = credential.token;
    //       options.headers['Authorization'] = 'Bearer $accessToken';
    //       handler.next(options);
    //     },
    //     onError: (error, handler) async {
    //       if (error.response?.statusCode == 401) {
    //         Get.offNamedUntil(
    //           Routes.LOGIN,
    //           ModalRoute.withName(Routes.LOGIN),
    //         );
    //         return;
    //       }
    //       handler.next(error);
    //     },
    //   ),
    // );
    return dio;
  }

  void addOtp(String otp) {
    _addHeaderEntries({
      'Header-OTP': otp,
    });
  }

  void removeOtp() {
    _removeHeaderEntry('Header-OTP');
  }

  void _addHeaderEntries(Map<String, String> entries) {
    dio.options.headers.addEntries(entries.entries);
  }

  void _removeHeaderEntry(String key) {
    dio.options.headers.remove(key);
  }
}
