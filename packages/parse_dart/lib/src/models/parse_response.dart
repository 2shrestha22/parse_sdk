/// Response returned by Parse.
class ParseResponse {
  /// Response returned by Parse.
  ParseResponse(this.statusCode, this.data);

  /// Status code sent by parse server
  final int statusCode;
  final Object? data;
}
