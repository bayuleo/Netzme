import 'package:flutter/foundation.dart';

import 'index.dart';

@immutable
class ResponseListToDo {
  const ResponseListToDo({
    required this.isSuccess,
    required this.message,
    this.data,
  });

  final bool isSuccess;
  final String message;
  final List<ResponseToDo>? data;

  factory ResponseListToDo.fromJson(Map<String, dynamic> json) =>
      ResponseListToDo(
          isSuccess: json['isSuccess'] as bool,
          message: json['message'].toString(),
          data: json['data'] != null
              ? (json['data'] as List? ?? [])
                  .map((e) => ResponseToDo.fromJson(e as Map<String, dynamic>))
                  .toList()
              : null);

  Map<String, dynamic> toJson() => {
        'isSuccess': isSuccess,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList()
      };
}
