import 'package:flutter/foundation.dart';

@immutable
class ResponseToDo {
  const ResponseToDo({
    required this.id,
    required this.title,
    required this.time,
    required this.desc,
    required this.complete,
  });

  final String id;
  final String title;
  final String time;
  final String desc;
  final bool complete;

  factory ResponseToDo.fromJson(Map<String, dynamic> json, [String? id]) =>
      ResponseToDo(
          id: id.toString(),
          title: json['title'].toString(),
          time: json['time'].toString(),
          desc: json['desc'].toString(),
          complete: json['complete'] as bool);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'time': time,
        'desc': desc,
        'complete': complete
      };

  ResponseToDo clone() => ResponseToDo(
      id: id, title: title, time: time, desc: desc, complete: complete);

  ResponseToDo copyWith(
          {String? id,
          String? title,
          String? time,
          String? desc,
          bool? complete}) =>
      ResponseToDo(
        id: id ?? this.id,
        title: title ?? this.title,
        time: time ?? this.time,
        desc: desc ?? this.desc,
        complete: complete ?? this.complete,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseToDo &&
          id == other.id &&
          title == other.title &&
          time == other.time &&
          desc == other.desc &&
          complete == other.complete;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      time.hashCode ^
      desc.hashCode ^
      complete.hashCode;
}
