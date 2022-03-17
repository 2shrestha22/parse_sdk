import 'package:freezed_annotation/freezed_annotation.dart';

part 'parse_response.freezed.dart';
part 'parse_response.g.dart';

class ParseResponse<T> {
  const ParseResponse({
    required this.toJson,
    required this.fromJson,
  });

  final Map<String, dynamic> Function(T value) toJson;
  final T Function(Map<String, dynamic> json) fromJson;

  // static Map<String, dynamic> toParseJson(ParseResponse parseResponse)
}

@freezed
class DataClass with _$DataClass {
  DataClass._();

  const factory DataClass({
    required String name,
  }) = _DataClass;

  factory DataClass.fromJson(Map<String, dynamic> json) =>
      _$DataClassFromJson(json);
}

class Service {
  void fun<T>() {
    final dataClass = ParseResponse.fromParseJson({'name': 'Sangam'}) as T;
  }
}
