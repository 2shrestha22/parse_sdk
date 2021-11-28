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

  /// Query with different contraints
  final Map<String, dynamic> _whereQuery = <String, dynamic>{};

  /// order query string
  final List<String> _order = [];

  ///  	Limit the number of objects returned by the query
  int? _limit;

  /// Use with limit to paginate through results
  int? _skip;

  ///	Restrict the fields returned by the query
  final List<String> _keys = [];

  /// Exclude specific fields from the returned query
  final List<String> _excludeKeys = [];

  /// Use on Pointer columns to return the full object
  String? _include;

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
    final query = <String, dynamic>{};
    if (_whereQuery.isNotEmpty) {
      query['where'] = jsonEncode(_whereQuery);
    }
    if (_order.isNotEmpty) {
      query['order'] = jsonEncode(_order);
    }
    if (_limit != null) {
      query['limit'] = jsonEncode(_limit);
    }
    if (_skip != null) {
      query['skip'] = jsonEncode(_skip);
    }
    if (_keys.isNotEmpty) {
      query['keys'] = jsonEncode(_keys);
    }
    if (_excludeKeys.isNotEmpty) {
      query['excludeKeys'] = jsonEncode(_excludeKeys);
    }

    // if all values are null that means query is `{}`, i.e. empty
    // then return null
    if (query.isEmpty) {
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

  /// You can use the order parameter to specify a field to sort by.
  ///
  /// You can sort by multiple fields by passing order a comma-separated list.

  /// To retrieve documents that are ordered by `score` in ascending order and
  /// the `name` in descending order:
  /// ```dart
  /// ParseObject().query('MyClassName').orderByAscending('score').orderByDescending('name');
  /// ```
  ///
  /// This sorts the results in descending order by the `name` field if the
  /// previous sort keys (ascending order by the `score` field) are equal.
  ParseQuery orderByAscending(String field) {
    _assertOrderClassName(field);
    _order.add(field);
    return this;
  }

  /// You can use the order parameter to specify a field to sort by.
  ///
  /// You can sort by multiple fields by passing order a comma-separated list.

  /// To retrieve documents that are ordered by `score` in ascending order and
  /// the `name` in descending order:
  /// ```dart
  /// ParseObject().query('MyClassName').orderByAscending('score').orderByDescending('name');
  /// ```
  ///
  /// This sorts the results in descending order by the `name` field if the
  /// previous sort keys (ascending order by the `score` field) are equal.
  ParseQuery orderByDescending(String field) {
    _assertOrderClassName(field);
    _order.add('-$field');
    return this;
  }

  /// You can use the `limit` and `skip` parameters for pagination.
  /// `limit` defaults to 100. In the old Parse hosted backend,
  /// the maximum limit was 1,000, but Parse Server removed that constraint.
  ///
  /// Thus, to retrieve 200 objects after skipping the first 400:
  /// ```dart
  /// ParseObject().query('MyClassName').limit(200).skip(400);
  /// ```
  ParseQuery limit(int limit) {
    _limit = limit;
    return this;
  }

  /// You can use the `limit` and `skip` parameters for pagination.
  /// `limit` defaults to 100. In the old Parse hosted backend,
  /// the maximum limit was 1,000, but Parse Server removed that constraint.
  ///
  /// Thus, to retrieve 200 objects after skipping the first 400:
  /// ```dart
  /// ParseObject().query('MyClassName').limit(200).skip(400);
  /// ```
  ParseQuery skip(int skip) {
    _skip = skip;
    return this;
  }

  ///	Restrict the fields returned by the query
  ParseQuery setKeys(List<String> fields) {
    _keys.addAll(fields);
    return this;
  }

  /// Exclude specific fields from the returned query
  ParseQuery excludeKeys(List<String> fields) {
    _excludeKeys.addAll(fields);
    return this;
  }

  void _assertOrderClassName(String field) {
    assert(!_order.contains(field),
        'Duplicated order field name. Same field should not be sorted multiple times.');
  }
}
