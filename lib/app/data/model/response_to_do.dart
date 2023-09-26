import 'package:flutter/foundation.dart';

@immutable
class ResponseToDo {
  const ResponseToDo({
    required this.id,
    required this.title,
    required this.time,
    required this.desc,
    required this.complete,
    required this.email,
  });

  final String id;
  final String title;
  final String time;
  final String desc;
  final bool complete;
  final String email;

  factory ResponseToDo.fromJson(Map<String, dynamic> json, [String? id]) =>
      ResponseToDo(
        id: id.toString(),
        title: json['title'].toString(),
        time: json['time'].toString(),
        desc: json['desc'].toString(),
        complete: json['complete'] as bool,
        email: json['email'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'time': time,
        'desc': desc,
        'complete': complete,
        'email': email
      };
}
