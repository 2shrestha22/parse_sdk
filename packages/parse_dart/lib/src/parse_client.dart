import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parse_dart/src/parse_options.dart';

/// HTTP client to do http requesta
class ParseClient extends http.BaseClient {
  // Private constructor
  ParseClient._(this._options, [http.Client? inner])
      : _inner = inner ?? http.Client();

  /// Client for presistence connection
  http.Client? _inner;

  /// Setup config for Parse
  final ParseOptions _options;

  static late ParseClient _instance;

  /// Initialize [ParseClient] with [ParseOptions] and optional [http.Client]
  static void init(ParseOptions options, [http.Client? client]) {
    _instance = ParseClient._(options, client);
  }

  /// Returns [Uri] concatenatinating serverUrl and [path]
  ///
  /// [path] must start with `/`
  ///
  /// e.g. `/api/account`
  Uri buildUri({
    /// Must start with '/'
    required String path,
    String? query,
    Map<String, dynamic>? queryParameters,
  }) {
    // remove '/' from end if there is.
    final baseUrl = (_options.serverUrl.endsWith('/'))
        ? _options.serverUrl.substring(0, _options.serverUrl.length - 1)
        : _options.serverUrl;

    return Uri.parse('$baseUrl$path').replace(
      query: query,
      queryParameters: queryParameters
          ?.map((key, value) => MapEntry(key, jsonEncode(value))),
    );
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_inner == null) {
      throw http.ClientException(
        'HTTP request failed. Client is already closed.',
        request.url,
      );
    }
    // add X-Parse-Application-Id header
    request.headers['X-Parse-Application-Id'] = _options.appId;
    // add X-Parse-Application-Id header
    if (_options.masterKey != null) {
      request.headers['X-Parse-Master-Key'] = _options.masterKey!;
    }
    // add X-Parse-REST-API-Key header if not empty
    if (_options.restApiKey != null) {
      request.headers['X-Parse-REST-API-Key'] = _options.restApiKey!;
    }

    return _inner!.send(request);
  }

  @override
  void close() {
    if (_inner != null) {
      _inner!.close();
      _inner = null;
    }
    super.close();
  }

  /// Instance of a [ParseClient]
  ///
  /// You need to initilize [ParseClient] with
  /// `ParseClient.init(options)` before using this.
  static ParseClient get instance => _instance;
}
