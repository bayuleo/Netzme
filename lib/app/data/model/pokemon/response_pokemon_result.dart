import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class ResponsePokemonResult {

  const ResponsePokemonResult({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory ResponsePokemonResult.fromJson(Map<String,dynamic> json) => ResponsePokemonResult(
    name: json['name'].toString(),
    url: json['url'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'url': url
  };

  ResponsePokemonResult clone() => ResponsePokemonResult(
    name: name,
    url: url
  );


  ResponsePokemonResult copyWith({
    String? name,
    String? url
  }) => ResponsePokemonResult(
    name: name ?? this.name,
    url: url ?? this.url,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponsePokemonResult && name == other.name && url == other.url;

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
