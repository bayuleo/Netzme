import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ParamToDo {

  const ParamToDo({
    required this.title,
    required this.time,
    required this.desc,
    required this.complete,
  });

  final String title;
  final String time;
  final String desc;
  final bool complete;

  factory ParamToDo.fromJson(Map<String,dynamic> json) => ParamToDo(
    title: json['title'].toString(),
    time: json['time'].toString(),
    desc: json['desc'].toString(),
    complete: json['complete'] as bool
  );
  
  Map<String, dynamic> toJson() => {
    'title': title,
    'time': time,
    'desc': desc,
    'complete': complete
  };

  ParamToDo clone() => ParamToDo(
    title: title,
    time: time,
    desc: desc,
    complete: complete
  );


  ParamToDo copyWith({
    String? title,
    String? time,
    String? desc,
    bool? complete
  }) => ParamToDo(
    title: title ?? this.title,
    time: time ?? this.time,
    desc: desc ?? this.desc,
    complete: complete ?? this.complete,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ParamToDo && title == other.title && time == other.time && desc == other.desc && complete == other.complete;

  @override
  int get hashCode => title.hashCode ^ time.hashCode ^ desc.hashCode ^ complete.hashCode;
}
