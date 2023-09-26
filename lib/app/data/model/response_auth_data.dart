import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

@immutable
class ResponseAuthData extends HiveObject {
  ResponseAuthData({
    required this.email,
    required this.name,
    required this.password,
  });

  @HiveField(0)
  final String email;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String password;

  factory ResponseAuthData.fromJson(Map<dynamic, dynamic> json) =>
      ResponseAuthData(
        email: json['email'].toString(),
        name: json['name'].toString(),
        password: json['password'].toString(),
      );

  Map<String, dynamic> toJson() =>
      {'email': email, 'name': name, 'password': password};
}
