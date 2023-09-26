import 'package:flutter/foundation.dart';

@immutable
class ParamToDo {
  const ParamToDo({
    required this.title,
    required this.time,
    required this.desc,
    required this.complete,
    required this.email,
  });

  final String title;
  final String time;
  final String desc;
  final bool complete;
  final String email;

  factory ParamToDo.fromJson(Map<String, dynamic> json) => ParamToDo(
        title: json['title'].toString(),
        time: json['time'].toString(),
        desc: json['desc'].toString(),
        complete: json['complete'] as bool,
        email: json['email'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'time': time,
        'desc': desc,
        'complete': complete,
        'email': email,
      };
}
