import 'dart:developer';

import 'package:parse_dart/parse_dart.dart';

import 'options.dart';

Future<void> main() async {
  ParseClient.init(options);

  final auth = Auth();

  final res = await auth.signup(username: 'username2', password: 'password');

  // final res = await auth.login(username: 'username', password: 'password');
  log(res.statusCode.toString());
  log(res.reasonPhrase ?? 'reasonPharse');
  log(res.body);
  log(res.request?.headers.toString() ?? '');
}
