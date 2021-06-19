
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('asset loading snippets', () {
    test('I can load a file from the assets', () async {
      final theAsset = await rootBundle.loadString('assets/json_file_asset.json');
      expect(theAsset, isNotNull);
    });
  });
}