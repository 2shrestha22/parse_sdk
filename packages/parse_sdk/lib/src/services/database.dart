import 'dart:convert';

import 'package:http/http.dart';
import 'package:parse_sdk/src/parse_client.dart';
import 'package:parse_sdk/src/query_builder.dart';
import 'package:parse_sdk/src/service.dart';

class ParseDatabase extends Service {
  ParseDatabase._() : super(ParseClient.instance) {
    _instance = ParseDatabase._();
  }

  static late ParseDatabase _instance;

  static ParseDatabase get instance => _instance;

  static ParseClass parseClass(String className) =>
      _ParseClass(className, _instance);

  /// Create a object in [className] class
  Future<Response> create({
    required String className,
    required Map<String, dynamic> data,
  }) {
    return client.post(
      client.buildUri(path: '/classes/$className'),
      body: jsonEncode(_removeGetOnlyFields(data)),
    );
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

abstract class ParseClass {}

class _ParseClass extends ParseClass {
  _ParseClass(this.className, this.database);
  final ParseDatabase database;
  final String className;

  /// Get a object with a [objectId] from [className]
  Future<Response> get(String objectId) {
    return database.client
        .get(database.client.buildUri(path: '/classes/$className/$objectId'));
  }

  /// Deletes a object with a [objectId] from [className]
  Future<dynamic> delete({
    required String className,
    required String objectId,
  }) {
    return client
        .delete(client.buildUri(path: '/classes/$className/$objectId'));
  }
}
