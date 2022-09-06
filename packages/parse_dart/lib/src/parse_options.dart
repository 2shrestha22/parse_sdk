/// Parse related config like server url, appId
class ParseOptions {
  /// Parse related config like server url, appId
  ParseOptions({
    required this.serverUrl,
    required this.appId,
    this.mountPath,
    this.masterKey,
    this.clientKey,
    this.restApiKey,
  }) : assert(
          serverUrl.startsWith(RegExp('http://|https://')),
          "endPoint $serverUrl must start with 'http'",
        );

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
}
