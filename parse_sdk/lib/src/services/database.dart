import 'dart:convert';

import 'package:parse_sdk/src/parse_client.dart';
import 'package:parse_sdk/src/query_builder.dart';
import 'package:parse_sdk/src/service.dart';

class ParseObject extends Service {
  ParseObject._() : super(ParseClient.instance);

  static ParseObject? _instance;

  /// Returns a singleton
  factory ParseObject() {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = ParseObject._();
    }
    return _instance!;
  }

  /// Get a object with a [objectId] from [className]
  Future<dynamic> get({
    required String className,
    required String objectId,
  }) async {
    final res = await client
        .get(client.buildUri(path: '/classes/$className/$objectId'));
    return res.body;
  }

  /// Deletes a object with a [objectId] from [className]
  Future<dynamic> delete({
    required String className,
    required String objectId,
  }) async {
    final res = await client
        .delete(client.buildUri(path: '/classes/$className/$objectId'));
    return res.body;
  }

  Future create({
    required String className,
    required Map<String, dynamic> data,
  }) async {
    final res = await client.post(
      client.buildUri(path: '/classes/$className'),
      body: jsonEncode(_removeGetOnlyFields(data)),
    );
    return res.body;
  }

  /// Get list of objects by performing query on [className] with provided
  /// constraints.
  ParseQuery query(String className) => ParseQuery(className, client);

  /// removes fields that should not be sent as data
  Map<String, dynamic> _removeGetOnlyFields(Map<String, dynamic> data) {
    return data
      ..remove('updatedAt')
      ..remove('objectId')
      ..remove('createdAt');
  }
}
