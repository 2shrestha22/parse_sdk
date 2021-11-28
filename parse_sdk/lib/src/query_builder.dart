import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parse_sdk/src/parse_client.dart';
import 'package:parse_sdk/src/services/database.dart';

@Immutable()
class ParseQuery {
  final String _className;
  final ParseClient _client;

  /// Allows to make complex queries on ParseServer
  ParseQuery(this._className, this._client);

  /// where query string
  final Map<String, dynamic> _whereQuery = <String, dynamic>{};

  /// order query string
  final List<String> _order = [];

  /// limit 	Limit the number of objects returned by the query
  // skip 	Use with limit to paginate through results
  // keys 	Restrict the fields returned by the query
  // excludeKeys 	Exclude specific fields from the returned query
  // include 	Use on Pointer columns to return the full object
  final Map<String, dynamic> _limiterQueries = <String, dynamic>{};

  /// Query objects from a [_className] with provided Query Constraints
  Future get() async {
    final res = await _client.get(
      _client.buildUri(
        path: '/classes/$_className',
        queryParameters: _getQueryParameters(),
      ),
    );
    return res.body;
  }

  Map<String, dynamic>? _getQueryParameters() {
    final query = {
      "where": jsonEncode(_whereQuery),
      "order": jsonEncode(_order),
    };
    // remove null values from query
    query.removeWhere((key, value) => jsonDecode(value)?.isEmpty ?? true);
    if (query.isEmpty) {
      // if all values are null that means query is `{}`, i.e. empty
      // then return null
      return null;
    } else {
      return query;
    }
  }

  /// Provides where query parameters
  ParseQuery where(
    String column, {

    /// $lt 	Less Than
    Object? isLessThan,

    /// $lte 	Less Than Or Equal To
    Object? isLessThanOrEqualTo,

    /// $gt 	Greater Than
    Object? isGreaterThan,

    /// $gte 	Greater Than Or Equal To
    Object? isGreaterThanOrEqualTo,

    /// $ne 	Not Equal To
    Object? isNotEqualTo,

    /// $in 	Contained In
    List<Object>? isContainedIn,

    /// $nin 	Not Contained in
    List<Object>? isNotContainedIn,

    /// $exists 	A value is set for the key
    Object? exists,

    /// $select 	This matches a value for a key in the result of a different query
    Object? select,

    /// $dontSelect 	Requires that a key’s value not match a value for a key in the result of a different query
    Object? dontSelect,

    /// $all 	Contains all of the given values
    Object? all,

    /// $regex 	Requires that a key’s value match a regular expression
    Object? regex,

    /// $text 	Performs a full text search on indexed fields
    Object? text,
  }) {
    assert(
      isLessThan != null ||
          isLessThanOrEqualTo != null ||
          isGreaterThan != null ||
          isGreaterThanOrEqualTo != null ||
          isNotEqualTo != null ||
          isContainedIn != null ||
          isNotContainedIn != null ||
          exists != null ||
          select != null ||
          dontSelect != null ||
          all != null ||
          regex != null ||
          text != null,
      "At least single where parameter is needed.",
    );

    _whereQuery.putIfAbsent(
      column,
      () => {
        "\$lt": isLessThan,
        "\$lte": isLessThanOrEqualTo,
        "\$gt": isGreaterThan,
        "\$gte": isGreaterThanOrEqualTo,
        "\$ne": isNotEqualTo,
        "\$in": isContainedIn,
        "\$nin": isNotContainedIn,
        "\$exists": exists,
        "\$select": select,
        "\$dontSelect": dontSelect,
        "\$all": all,
        "\$regex": regex,
        "\$text": text
      }..removeWhere((key, value) => value == null),
    );
    return this;
  }

  /// [ParseQuery] to get object where the [String] column equals [value]
  ParseQuery whereEqualTo(String column, dynamic value) {
    _whereQuery.putIfAbsent(column, () => value);
    return this;
  }

  /// You can use the order (ascending) parameter to specify a field to sort by.
  /// Prefixing with a negative sign reverses the order (descending).
  ///
  /// You can sort by multiple fields by passing order a comma-separated list.

  /// To retrieve documents that are ordered by `scores` in ascending order and
  /// the `name` in descending order:
  /// ```dart
  /// ParseObject().query('MyClassName').order(["scores", "-name"]);
  /// ```
  ///
  /// This sorts the results in descending order by the `name` field if the
  /// previous sort keys (ascending order by the `score` field) are equal.
  ParseQuery order(List<String> orderList) {
    _order.addAll(orderList);
    return this;
  }
}
