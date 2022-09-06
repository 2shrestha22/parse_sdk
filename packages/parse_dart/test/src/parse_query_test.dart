import 'package:parse_dart/src/parse_query.dart';
import 'package:test/test.dart';

void main() {
  late ParseQuery parseQuery;

  setUp(() {
    parseQuery = ParseQuery('SomeClass');
  });

  group(
    'Correct query is built: ',
    () {
      test(
        'Retrieve Sean Plott’s scores that were not in cheat mode.',
        () async {
          final query = parseQuery
            ..whereEqualTo('playerName', 'Sean Plott')
            ..whereEqualTo('cheatMode', false);

          final expected = <String, dynamic>{
            'where': {'playerName': 'Sean Plott', 'cheatMode': false}
          };

          expect(query.build(), equals(expected));
        },
      );
      test(
        'Retrieve scores between 1000 and 3000, including the endpoints.',
        () async {
          final query = parseQuery
            ..where('score',
                greaterThanOrEqualTo: 1000, lessThanOrEqualTo: 3000);

          final expected = <String, dynamic>{
            'where': {
              'score': {r'$gte': 1000, r'$lte': 3000}
            }
          };

          expect(query.build(), equals(expected));
        },
      );
      test(
        'Retrieve scores equal to an odd number below 10.',
        () async {
          final query = parseQuery
            ..where('score', containedIn: [1, 3, 5, 7, 9]);

          final expected = <String, dynamic>{
            'where': {
              'score': {
                r'$in': [1, 3, 5, 7, 9]
              }
            }
          };

          expect(query.build(), equals(expected));
        },
      );
      test(
        'Retrieve scores not by a given list of players.',
        () async {
          final query = parseQuery
            ..where('playerName', notContainedIn: [
              'Jonathan Walsh',
              'Dario Wunsch',
              'Shawn Simon'
            ]);

          final expected = <String, dynamic>{
            'where': {
              'playerName': {
                r'$nin': ['Jonathan Walsh', 'Dario Wunsch', 'Shawn Simon']
              }
            }
          };

          expect(query.build(), equals(expected));
        },
      );
      test(
        'Retrieve documents with the score set.',
        () async {
          final query = parseQuery..where('score', exists: true);

          final expected = <String, dynamic>{
            'where': {
              'score': {r'$exists': true}
            }
          };

          expect(query.build(), equals(expected));
        },
      );
      test(
        'Retrieve documents without the score set.',
        () async {
          final query = parseQuery..where('score', exists: false);

          final expected = <String, dynamic>{
            'where': {
              'score': {r'$exists': false}
            }
          };

          expect(query.build(), equals(expected));
        },
      );
      test(
        'Select query.',
        () async {
          final query = parseQuery
            ..whereMatchesKeyInQuery(
              'hometown',
              'city',
              ParseQuery('Team')..where('winPct', greaterThan: 0.5),
            );

          final expected = <String, dynamic>{
            'where': {
              'hometown': {
                r'$select': {
                  'query': {
                    'className': 'Team',
                    'where': {
                      'winPct': {r'$gt': 0.5}
                    }
                  },
                  'key': 'city'
                }
              }
            }
          };

          expect(query.build(), equals(expected));
        },
      );
    },
  );
}
