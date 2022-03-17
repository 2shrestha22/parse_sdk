import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:parse_sdk/model/parse_file.dart';
import 'package:parse_sdk/parse_sdk.dart';
import 'package:parse_sdk/src/parse_client.dart';
import 'package:parse_sdk/src/service.dart';

class ParseStorage extends Service {
  ParseStorage._() : super(ParseClient.instance);

  static ParseStorage? _instance;

  /// Returns a singleton
  factory ParseStorage() {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = ParseStorage._();
    }
    return _instance!;
  }

  Future<Response> uploadImage({required File file, String? fileName}) async {
    return client
        .post(client.buildUri(path: '/files/pic.jpg'),
            body: file.readAsBytesSync().fold<List<int>>(<int>[],
                (List<int> previous, int element) => previous..add(element)))
        .then((value) {
      final parseFile = ParseFile.fromJson(jsonDecode(value.body));
      return ParseDatabase().create(
        className: 'File',
        data: {
          "name": fileName,
          "file": {
            "name": parseFile.name,
            "url": parseFile.url,
            "__type": "File"
          }
        },
      );
    });
  }
}
