import 'package:flutter/material.dart';
import 'package:parse_sdk/parse_sdk.dart';

import 'home_page.dart';

void main() {
  final parseClient = ParseClient(
    ParseOptions(
      serverUrl: 'http://localhost:1337/parse',
      appId: 'SECRET_APP_ID',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
