import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class ResponsePokemon {

  const ResponsePokemon({
    required this.count,
    required this.next,
    required this.previous,
    this.results,
  });

  final int count;
  final String next;
  final dynamic previous;
  final List<ResponsePokemonResult>? results;

  factory ResponsePokemon.fromJson(Map<String,dynamic> json) => ResponsePokemon(
    count: json['count'] as int,
    next: json['next'].toString(),
    previous: json['previous'] as dynamic,
    results: json['results'] != null ? (json['results'] as List? ?? []).map((e) => ResponsePokemonResult.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'count': count,
    'next': next,
    'previous': previous,
    'results': results?.map((e) => e.toJson()).toList()
  };

  ResponsePokemon clone() => ResponsePokemon(
    count: count,
    next: next,
    previous: previous,
    results: results?.map((e) => e.clone()).toList()
  );


  ResponsePokemon copyWith({
    int? count,
    String? next,
    dynamic? previous,
    Optional<List<ResponsePokemonResult>?>? results
  }) => ResponsePokemon(
    count: count ?? this.count,
    next: next ?? this.next,
    previous: previous ?? this.previous,
    results: checkOptional(results, () => this.results),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponsePokemon && count == other.count && next == other.next && previous == other.previous && results == other.results;

  @override
  int get hashCode => count.hashCode ^ next.hashCode ^ previous.hashCode ^ results.hashCode;
}
