/// Allows to make complex queries on ParseServer
class ParseQuery {
  /// Allows to make complex queries on ParseServer
  ParseQuery(this.className);

  /// Name of the class to perform query on.
  final String className;

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

  /// Build query that can be used while doing http request.
  ///
  /// It is actually headers to be used. For example:
  ///
  /// ```dart
  /// {
  ///   "where":
  ///   {
  ///     "name":{"$text":{"$search":{"$term":"Daddy"}}}
  ///   },
  ///   "order":"$score",
  ///   "key":"$score"
  /// }
  /// ```
  Map<String, dynamic>? build() {
    final query = <String, dynamic>{};
    if (_whereQuery.isNotEmpty) {
      query['where'] = _whereQuery;
    }
    if (_order.isNotEmpty) {
      query['order'] = _order;
    }
    if (_limit != null) {
      query['limit'] = _limit;
    }
    if (_skip != null) {
      query['skip'] = _skip;
    }
    if (_keys.isNotEmpty) {
      query['keys'] = _keys;
    }
    if (_excludeKeys.isNotEmpty) {
      query['excludeKeys'] = _excludeKeys;
    }

    // if all values are null that means query is `{}`, i.e. empty
    // then return null
    if (query.isEmpty) {
      return null;
    } else {
      return query;
    }
  }

  /// Instead of an exact match, provide a hash with keys corresponding to
  /// the comparisons to do.
  void where(
    String column, {

    /// $lt 	Less Than
    Object? lessThan,

    /// $lte 	Less Than Or Equal To
    Object? lessThanOrEqualTo,

    /// $gt 	Greater Than
    Object? greaterThan,

    /// $gte 	Greater Than Or Equal To
    Object? greaterThanOrEqualTo,

    /// $ne 	Not Equal To
    Object? notEqualTo,

    /// $in 	Contained In
    List<Object>? containedIn,

    /// $nin 	Not Contained in
    List<Object>? notContainedIn,

    /// $exists 	A value is set for the key
    bool? exists,

    // /// $select 	This matches a value for a key in the result of a different query
    // Object? select,

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
      lessThan != null ||
          lessThanOrEqualTo != null ||
          greaterThan != null ||
          greaterThanOrEqualTo != null ||
          notEqualTo != null ||
          containedIn != null ||
          notContainedIn != null ||
          exists != null ||
          // select != null ||
          dontSelect != null ||
          all != null ||
          regex != null ||
          text != null,
      'At least single where parameter is needed.',
    );

    _whereQuery.putIfAbsent(
      column,
      () => {
        r'$lt': _toParsedObject(lessThan),
        r'$lte': _toParsedObject(lessThanOrEqualTo),
        r'$gt': _toParsedObject(greaterThan),
        r'$gte': _toParsedObject(greaterThanOrEqualTo),
        r'$ne': _toParsedObject(notEqualTo),
        r'$in': _toParsedObject(containedIn),
        r'$nin': _toParsedObject(notContainedIn),
        r'$exists': _toParsedObject(exists),
        // r'$select': _toParsedObject(select),
        r'$dontSelect': _toParsedObject(dontSelect),
        r'$all': _toParsedObject(all),
        r'$regex': _toParsedObject(regex),
        r'$text': _toParsedObject(text)
      }..removeWhere((key, value) => value == null),
    );
  }

  /// [ParseQuery] to get object where the [String] column equals [value]
  void whereEqualTo(String column, dynamic value) {
    _whereQuery.putIfAbsent(column, () => value);
  }

  /// Get objects where a key matches the value of a key in a set of objects
  /// resulting from another query.
  ///
  /// For example, if you have a class containing sports teams and you store a
  /// user’s hometown in the user class, you can issue one query to find the
  /// list of users whose hometown teams have winning records.
  void whereMatchesKeyInQuery(
    String column,
    String key,
    ParseQuery query,
  ) {
    final matcherQuery = {
      'query': <String, dynamic>{
        'className': query.className,
      }..addAll(query.build() ?? {}),
      'key': key,
    };

    _whereQuery.putIfAbsent(column, () => {r'$select': matcherQuery});
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
  void orderByAscending(String field) {
    _assertOrderClassName(field);
    _order.add(field);
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
  void orderByDescending(String field) {
    _assertOrderClassName(field);
    _order.add('-$field');
  }

  /// You can use the `limit` and `skip` parameters for pagination.
  /// `limit` defaults to 100. In the old Parse hosted backend,
  /// the maximum limit was 1,000, but Parse Server removed that constraint.
  ///
  /// Thus, to retrieve 200 objects after skipping the first 400:
  /// ```dart
  /// ParseObject().query('MyClassName').limit(200).skip(400);
  /// ```
  void limit(int limit) {
    _limit = limit;
  }

  /// You can use the `limit` and `skip` parameters for pagination.
  /// `limit` defaults to 100. In the old Parse hosted backend,
  /// the maximum limit was 1,000, but Parse Server removed that constraint.
  ///
  /// Thus, to retrieve 200 objects after skipping the first 400:
  /// ```dart
  /// ParseObject().query('MyClassName').limit(200).skip(400);
  /// ```
  void skip(int skip) {
    _skip = skip;
  }

  ///	Restrict the fields returned by the query so the result only contains
  /// given fileds.
  ///
  /// But result always contain special built-in fields such as `objectId`,
  /// `createdAt`, and `updatedAt`
  void setKeys(List<String> fields) {
    _keys.addAll(fields);
  }

  /// Exclude specific fields from the returned query so the result does not
  /// contain given fields.
  ///
  /// But result always contain special built-in fields such as `objectId`,
  /// `createdAt`, and `updatedAt`
  void excludeKeys(List<String> fields) {
    _excludeKeys.addAll(fields);
  }

  void _assertOrderClassName(String field) {
    assert(!_order.contains(field),
        'Duplicated order field name. Same field should not be sorted multiple times.');
  }

  Object? _toParsedObject(Object? object) {
    if (object is DateTime) {
      return {'__type': 'Date', 'iso': object.toIso8601String()};
    }
    return object;
  }
}
