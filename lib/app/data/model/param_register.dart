import 'package:flutter/foundation.dart';

@immutable
class ParamRegister {
  const ParamRegister({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  factory ParamRegister.fromJson(Map<String, dynamic> json) => ParamRegister(
      name: json['name'].toString(),
      email: json['email'].toString(),
      password: json['password'].toString());

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'password': password};
}
