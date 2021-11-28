import 'dart:developer';

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
  Future get({
    required String className,
    required String objectId,
  }) async {
    final res = await client
        .get(client.buildUri(path: '/classes/$className/$objectId'));
    return res.body;
  }

  /// Query objects from a [className] with provided Query Constraints
  ParseQuery query(String className) => ParseQuery(className, client);

  Future createObject({
    required String className,
    required Map<String, dynamic> data,
  }) async {
    final res = await client.post(
      client.buildUri(path: '/classes/$className'),
      body: data,
    );
    log(res.body);
    return res.body;
  }
}



// query parameters
// where
// order 	Specify a field to sort by
// limit 	Limit the number of objects returned by the query
// skip 	Use with limit to paginate through results
// keys 	Restrict the fields returned by the query
// excludeKeys 	Exclude specific fields from the returned query
// include 	Use on Pointer columns to return the full object

// where query parameter supports these options
// $lt 	Less Than
// $lte 	Less Than Or Equal To
// $gt 	Greater Than
// $gte 	Greater Than Or Equal To
// $ne 	Not Equal To
// $in 	Contained In
// $nin 	Not Contained in
// $exists 	A value is set for the key
// $select 	This matches a value for a key in the result of a different query
// $dontSelect 	Requires that a key’s value not match a value for a key in the result of a different query
// $all 	Contains all of the given values
// $regex 	Requires that a key’s value match a regular expression
// $text 	Performs a full text search on indexed fields
