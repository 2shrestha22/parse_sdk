import 'dart:convert';
import 'dart:developer';

import 'package:parse_sdk/src/parse_client.dart';

// class QueryBuilder {
//   final String className;

//   final a = QueryBuilder('ClassName').where('book').isEqualTo('My Book');

//   QueryBuilder(this.className);
// }

class ParseQuery {
  final String _className;
  final ParseClient _client;

  /// Allows to make complex queries on ParseServer
  ParseQuery(this._className, this._client);

  final Map<String, dynamic> _whereQueries = <String, dynamic>{};
  final Map<String, dynamic> _limiterQueries = <String, dynamic>{};

  String? queryString;

  /// Query objects from a [_className] with provided Query Constraints
  Future get() async {
    // _buildQueryString();
    final res = await _client.get(
      _client.buildUri(
        path: '/classes/$_className',
        query: _buildQueryString(),
      ),
    );
    return res.body;
  }

  String? _buildQueryString() {
    if (_whereQueries.isEmpty) return null;
    final encodedStr = jsonEncode(_whereQueries);
    final qStr = '''where=$encodedStr''';
    log('Query String starts.');
    log(qStr);
    log('Query String ends');
    return qStr;
  }

  /// Returns an object where the [String] column equals [value]
  ParseQuery whereEqualTo(String column, dynamic value) {
    _whereQueries.putIfAbsent(column, () => value);
    return this;
  }

  ParseQuery whereNotEqualTo(String column, dynamic value) {
    _whereQueries.putIfAbsent(column, () => {'\$ne': value});
    return this;
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
