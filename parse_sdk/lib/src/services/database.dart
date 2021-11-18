import 'package:parse_sdk/src/parse_client.dart';
import 'package:parse_sdk/src/service.dart';

class ParseObject extends Service {
  ParseObject(ParseClient client) : super(client);

  /// Get a object
  Future getObject({
    required String className,
    required String objectId,
  }) async {
    final res = client.get(client.uri('/parse/classes/$className/$objectId'));
    return 'd';
  }
}
