import 'package:flutter/material.dart';
import 'package:parse_sdk/parse_sdk.dart';

import 'home_page.dart';

void main() {
  ParseClient.init(ParseOptions(
      // serverUrl: 'http://192.168.1.89:1337/parse',
      serverUrl: 'http://10.0.2.2:1337/parse',
      appId: 'SECRET_APP_ID',
      masterKey: 'SECRET_MASTER_KEY'));
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
