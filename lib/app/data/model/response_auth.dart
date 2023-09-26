import 'package:flutter/foundation.dart';

import 'response_auth_data.dart';

@immutable
class ResponseAuth {
  const ResponseAuth({
    required this.isSuccess,
    required this.message,
    this.data,
  });

  final bool isSuccess;
  final String message;
  final ResponseAuthData? data;

  factory ResponseAuth.fromJson(Map<String, dynamic> json) => ResponseAuth(
        isSuccess: json['isSuccess'] as bool,
        message: json['message'].toString(),
        data: json['data'] != null
            ? ResponseAuthData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'isSuccess': isSuccess,
        'message': message,
        'data': data?.toJson(),
      };
}
