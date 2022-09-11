import 'dart:convert';

import 'package:http/http.dart';

import 'package:parse_dart/src/parse_client.dart';

/// Service for Parse to do get and post request.
abstract class Service {
  /// Service for Parse to do get and post request.
  const Service(this._client);
  final ParseClient _client;

  /// Perform a get request.
  ///
  /// [path] must start with `/`
  ///
  /// e.g. `/classes/GameScore`, `/users`
  Future<Response> get({
    required String path,
    required Map<String, dynamic>? queryParameters,
  }) {
    return _client.get(
      _client.buildUri(
        path: path,
        queryParameters: queryParameters,
      ),
    );
  }

  /// Perform a post request.
  ///
  /// [path] must start with `/`
  ///
  /// e.g. `/classes/GameScore`, `/users`
  Future<Response> post({
    required String path,
    required Map<String, dynamic> data,
  }) {
    return _client.post(
      _client.buildUri(path: path),
      body: jsonEncode(_removeGetOnlyFields(data)),
    );
  }

  /// Perform a put request.
  ///
  /// [path] must start with `/`
  ///
  /// e.g. `/classes/GameScore`, `/users`
  Future<Response> put({
    required String path,
    required Map<String, dynamic> data,
  }) {
    return _client.post(
      _client.buildUri(path: path),
      body: jsonEncode(_removeGetOnlyFields(data)),
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
