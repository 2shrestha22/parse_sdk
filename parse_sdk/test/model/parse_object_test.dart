import 'package:flutter_test/flutter_test.dart';

import 'parse_model.dart';

void main() {
  test(
    'ParseObject should parse JSON correctly',
    () {
      final ExampleParseObject exObj = ExampleParseObject('Lenovo', 16);

      expect(exObj.model, 'Lenovo');
      expect(exObj.ram, 16);
    },
  );
}
