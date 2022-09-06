import 'dart:convert';

import 'package:http/http.dart';
import 'package:parse_dart/src/parse_client.dart';
import 'package:parse_dart/src/parse_query.dart';
import 'package:parse_dart/src/service.dart';

/// Alows to access database/classes on ParseServer.
class ParseDatabase extends Service {
  /// Alows to access database/classes on ParseServer.
  ParseDatabase() : super(ParseClient.instance);

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

  /// Get list of objects by performing query with provided constraints.
  Future<Response> query(ParseQuery query) {
    return client.get(
      client.buildUri(
        path: '/classes/${query.className}',
        queryParameters: query.build(),
      ),
    );
  }

  /// Removes fields that should not be sent as data because they cant be set
  /// or updated.
  Map<String, dynamic> _removeGetOnlyFields(Map<String, dynamic> data) {
    return data
      ..remove('updatedAt')
      ..remove('objectId')
      ..remove('createdAt');
  }
}
