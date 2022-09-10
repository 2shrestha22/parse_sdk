import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:parse_dart/parse_dart.dart';

import 'options.dart';

Future<void> main() async {
  final faker = Faker();

  ParseClient.init(options);

  final db = ParseDatabase();

  await db.create(
    className: 'Players',
    data: {
      'name': faker.person.name(),
      'city': faker.address.city(),
      'followerCount': faker.randomGenerator.integer(10000),
    },
  );

  final res = await db.query(
    ParseQuery('Players')
      ..where('followerCount', greaterThan: 400, lessThan: 3000)
      ..limit(20),
  );

  log(res.body);
}
