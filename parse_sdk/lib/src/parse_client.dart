import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ParseClient extends http.BaseClient {
  /// [Client] for presistence connection
  http.Client? _inner;

  /// Setup config for Parse
  final ParseOptions _options;

  // Private constructor
  ParseClient._(this._options, [http.Client? inner])
      : _inner = inner ?? http.Client();

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
    required String path,
    String? query,
    Map<String, dynamic>? queryParameters,
  }) {
    final baseUrl = (_options.serverUrl.endsWith('/'))
        ? _options.serverUrl.substring(0, _options.serverUrl.length - 1)
        : _options.serverUrl;

    return Uri.parse("$baseUrl$path")
        .replace(query: query, queryParameters: queryParameters);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_inner == null) {
      throw http.ClientException(
          'HTTP request failed. Client is already closed.', request.url);
    }
    // add X-Parse-Application-Id header
    request.headers['X-Parse-Application-Id'] = _options.appId;
    // add X-Parse-REST-API-Key header if not empty
    if (_options.restApiKey != null) {
      request.headers['X-Parse-REST-API-Key'] = _options.restApiKey!;
    }

    log('${request.method}: ${request.url.origin}/${request.url.path}');
    log('Headers:\n${jsonEncode(request.headers)}');
    log('QueryParams:\n${request.url.queryParameters}');
    log('\n\n');
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

class ParseOptions {
  /// https://YOUR.PARSE-SERVER.HERE/MOUNT-PATH/
  final String serverUrl;

  /// APPLICATION_ID
  final String appId;

  /// MOUNT_PATH
  final String? mountPath;

  /// MASTER_KEY
  final String? masterKey;

  /// CLIENT_KEY
  final String? clientKey;

  /// REST_API_KEY
  final String? restApiKey;

  /// Parse related config like server url, appId
  ParseOptions({
    required this.serverUrl,
    required this.appId,
    this.mountPath,
    this.masterKey,
    this.clientKey,
    this.restApiKey,
  }) : assert(serverUrl.startsWith(RegExp("http://|https://")),
            "endPoint $serverUrl must start with 'http'");
}
