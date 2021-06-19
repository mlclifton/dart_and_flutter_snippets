
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // one to be aware of... without this line asset bundles don't load outside of widget tests
  // See https://stackoverflow.com/questions/59027915/accessing-rootbundle-in-flutter-unit-test
  TestWidgetsFlutterBinding.ensureInitialized();

  group('asset loading snippets', () {
    test('I can load a file from the assets', () async {
      final theAsset = await rootBundle.loadString('assets/json_file_asset.json');
      expect(theAsset, isNotNull);
    });
  });
}