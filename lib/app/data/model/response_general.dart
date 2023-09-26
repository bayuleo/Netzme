import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ResponseGeneral {

  const ResponseGeneral({
    required this.isSuccess,
    required this.message,
  });

  final bool isSuccess;
  final String message;

  factory ResponseGeneral.fromJson(Map<String,dynamic> json) => ResponseGeneral(
    isSuccess: json['isSuccess'] as bool,
    message: json['message'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'isSuccess': isSuccess,
    'message': message
  };

  ResponseGeneral clone() => ResponseGeneral(
    isSuccess: isSuccess,
    message: message
  );


  ResponseGeneral copyWith({
    bool? isSuccess,
    String? message
  }) => ResponseGeneral(
    isSuccess: isSuccess ?? this.isSuccess,
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseGeneral && isSuccess == other.isSuccess && message == other.message;

  @override
  int get hashCode => isSuccess.hashCode ^ message.hashCode;
}
