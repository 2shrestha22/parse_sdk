import 'package:http/http.dart' show Response;
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
    return post(path: '/classes/$className', data: data);
  }

  /// Get list of objects by performing query with provided constraints.
  Future<Response> query(ParseQuery query) {
    return get(
      path: '/classes/${query.className}',
      queryParameters: query.build(),
    );
  }
}
