import 'dart:convert';

import 'package:parse_sdk/model/parse_object.dart';

class ExampleParseObject extends ParseObject {
  ExampleParseObject(
    this.model,
    this.ram,
  ) : super('Ex');

  final String model;
  final int ram;

  ExampleParseObject copyWith({
    String? model,
    int? ram,
  }) {
    return ExampleParseObject(
      model ?? this.model,
      ram ?? this.ram,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'ram': ram,
    };
  }

  factory ExampleParseObject.fromMap(Map<String, dynamic> map) {
    return ExampleParseObject(
      map['model'] ?? '',
      map['ram']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExampleParseObject.fromJson(String source) =>
      ExampleParseObject.fromMap(json.decode(source));

  @override
  String toString() => 'Ex(model: $model, ram: $ram)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExampleParseObject &&
        other.model == model &&
        other.ram == ram;
  }

  @override
  int get hashCode => model.hashCode ^ ram.hashCode;
}
